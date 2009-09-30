require 'httpclient'

module DopisOnlineClient
  class Request
    
    attr_reader :username, :password, :color, :postage_type, :payment_type, :response_format, :pdf_file
  
    def initialize(params)
      @username = params[:username]
      @password = params[:password]
      @color = params[:color] || 0 # cernobile
      @postage_type = params[:postage_type] || 66 # obycejne
      @payment_type = params[:payment_type] || 0 # fakturou
      @format = params[:format] || :xml
      @pdf_file_path = params[:pdf_file_path]
    end
  
    def deliver
      client = HTTPClient.new
      client.ssl_config.verify_mode=OpenSSL::SSL::VERIFY_NONE
      response = client.post @@base_uri, {
        :user => @@username,
        :passwd => @@password,
        :barvatisku => @color,
        :typvyplatneho => @postage_type,
        :typuhrady => @payment_type,
        :typvystupu => @format.to_s,
        :soubor => File.new(@pdf_file_path)
      }
      parsed_response = parse_response(response.body.content)
      DopisOnlineClient::Response.new(parsed_response, response.body, response.code)
    end
  
    def parse_response(body)
      return nil if body.nil? or body.empty?
      case @format
        when :xml
          Crack::XML.parse(body)
        else
          body
        end
    end
  
    def self.send(params)
      @request = new(params).deliver
    end
  
    def self.base_uri(uri)
      @@base_uri=uri
    end
  
    def self.auth(username, password)
      @@username=username
      @@password=password
    end

  end
end