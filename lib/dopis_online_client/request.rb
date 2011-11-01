module DopisOnlineClient
  class Request

    include HTTMultiParty

    attr_reader :username, :password, :color, :postage_type, :payment_type, :response_format, :pdf_file
  
    def initialize(params)
      @color = params[:color] || 0 # cernobile
      @postage_type = params[:postage_type] || 195 # obycejne
      @payment_type = params[:payment_type] || 0 # fakturou
      @format = params[:format] || :xml
      @pdf_file_path = params[:pdf_file_path]
      self.class.base_uri DopisOnlineClient.base_uri
    end
  
    def deliver
      response = self.class.post '/dopisonline.php', :body => {
        :user => DopisOnlineClient.username,
        :passwd => DopisOnlineClient.password,
        :barvatisku => @color,
        :typvyplatneho => @postage_type,
        :typuhrady => @payment_type,
        :typvystupu => @format.to_s,
        :soubor => File.new(@pdf_file_path)
      }
      parsed_response = parse_response(response.body)
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

  end
end