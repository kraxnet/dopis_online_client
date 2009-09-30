module DopisOnlineClient
  class Response
    attr_accessor :body, :code
    attr_reader :delegate

    def initialize(delegate, body, code)
      @delegate = delegate
      @body = body
      @code = code.to_i
    end

    def method_missing(name, *args, &block)
      @delegate.send(name, *args, &block)
    end

    def success?
      code==200 && !has_key?("chyba") && has_key?("zakazka")
    end

    def filename
      success_result["soubor"]
    end

    def pages_count
      success_result["pocetstranek"].to_i
    end

    def order_code
      success_result["kodobjednavky"].to_i
    end

    def tracking_number
      success_result["podacicislo"]
    end

    def posting_date
      success_result["datumpodani"]
    end

    def posting_zip
      success_result["podaciposta"]
    end

    def price
      success_result["cena"]
    end

    def color
      success_result["barvatisku"]=="1"
    end

    def shipping_method
      success_result["typvyplatneho"]
    end

    def failure_message
      failure_result["popis"]
    end

    def failure_code
      failure_result["kod"].to_i
    end

    private
    def success_result
      return {} unless has_key?("zakazka")
      fetch("zakazka")
    end

    def failure_result
      return {} unless has_key?("chyba")
      fetch("chyba")
    end
  end
end
