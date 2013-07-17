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

    # Byl dopis úspěšně přijat k odeslání?
    def success?
      code==200 && !has_key?("chyba") && has_key?("zakazka")
    end

    # Jméno odeslaného souboru
    def filename
      success_result["soubory"]["soubor"]["name"]
    end

    # Počet stránek
    def pages_count
      success_result["pocet_stranek"].to_i
    end

    # Kód objednávky
    def order_code
      success_result["kod_objednavky"]
    end

    # Podací číslo
    def tracking_number
      success_result["podaci_cislo"]
    end

    # Datum podání
    def posting_date
      success_result["datumpodani"]
    end

    # PSČ podací pošty
    def posting_zip
      success_result["podaciposta"]
    end

    # Cena
    def price
      success_result["cena"]
    end

    # Barva tisku
    #
    # * Barevný <tt>true</tt>
    # * černobílý <tt>false</tt>
    def color
      success_result["barvatisku"]=="1"
    end

    def shipping_method
      success_result["typvyplatneho"]
    end

    # Popis chyby
    def failure_message
      failure_result["popis"]
    end

    # Kód chyby
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
