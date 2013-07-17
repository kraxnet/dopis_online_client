require 'builder'
require 'base64'
require 'ostruct'

module DopisOnlineClient
  class Request

    include HTTMultiParty

    DEFAULTS = {:postage_type => 195, # common
                :coupon_type => 0, # do not print
                :print_type => 0, # one-sided print
                :sender_type => 2, # from 1st page of the document
                :recipient_type => 2
    }


    attr_reader :pdf_file_path, :options

    # Public: Sends the request to the service
    #
    # pdf_file_path - string with the path to the pdf file, that will be send
    # params - hash with the additional parameters
    #
    # Returns new DopisOnlineClient::Response
    #
    def self.send(pdf_file_path, params = {})
      @request = new(pdf_file_path, params).deliver
    end

    # Public: Initializes library
    #
    # pdf_file_path - string with the path to the pdf file, that will be send
    # params - hash with the additional parameters
    #
    def initialize(pdf_file_path, params = {})
      params.merge!(DEFAULTS)
      @options = OpenStruct.new(params)
      @pdf_file_path = pdf_file_path
      self.class.base_uri DopisOnlineClient.base_uri
    end

    # Public: Delivers payload to service
    #
    # Returns new DopisOnlineClient::Response
    #
    def deliver
      response = self.class.post '/dopisonline/donApi.php', :body => body
      parsed_response = parse_response(response.body)
      DopisOnlineClient::Response.new(parsed_response, response.body, response.code)
    end

    # Internal: parses the body of the response
    #
    # body - string with service response
    #
    # Returns nil if the body is not present
    #
    def parse_response(body)
      return nil if body.nil? or body.empty?
      case options.format
      when :xml
        MultiXml.parse(body)
      else
        body
      end
    end

    # Internal: returns hash with request body
    #
    # Returns Hash with request body
    #
    def body
      xml = Builder::XmlMarkup.new( :indent => 2 )
      xml.instruct! :xml, :encoding => "UTF-8"
      xml.dataroot do |dataroot|
        dataroot.typvyplatneho options.postage_type
        dataroot.typtisku options.print_type
        dataroot.tiskpoukazky options.coupon_type
        dataroot.typods options.sender_type
        dataroot.typadr options.recipient_type
        dataroot.odsid nil
        dataroot.odsobrazek nil
        dataroot.odsfirma nil
        dataroot.odsosoba nil
        dataroot.odsulice nil
        dataroot.odscp nil
        dataroot.odsco nil
        dataroot.odsobec nil
        dataroot.odspsc nil
        dataroot.adrosloveni nil
        dataroot.adrfirma nil
        dataroot.adrosoba nil
        dataroot.adrulice nil
        dataroot.adrcp nil
        dataroot.adrco nil
        dataroot.adrobec nil
        dataroot.adrpsc nil
        dataroot.adriso nil
        dataroot.soubory  do |soubory|
          soubory.soubor(:mimeType => "", :name => @pdf_file_path.split("/").last) do |soubor|
            soubor.dataSoubor Base64.encode64(File.read(@pdf_file_path))
          end
        end
      end

      xml_file = Tempfile.new(["DopisOnlineNew_1_1", ".xml"])
      xml_file.write xml.target!
      xml_file.flush
      xml_file.rewind

      {
        :user => DopisOnlineClient.username,
        :password => DopisOnlineClient.password,
        :soubor => xml_file
      }
    end
  end
end
