module DopisOnlineClient
  class StatusRequest

    include HTTMultiParty

    attr_reader :username, :password, :color, :postage_type, :payment_type, :response_format, :pdf_file
  
    def initialize(params)
      @format = params[:format] || :xml
      @tracking_number = params[:tracking_number]
      @date = params[:date]
      self.class.base_uri DopisOnlineClient.base_uri
    end
  
    def deliver
      response = self.class.post '/eprehledZak.php', :query => {
        :user => DopisOnlineClient.username,
        :passwd => DopisOnlineClient.password,
        :typvystupu => @format,
        :zasilka => @tracking_number,
        :datum => @date
      }
      response.body
    end

  end
end