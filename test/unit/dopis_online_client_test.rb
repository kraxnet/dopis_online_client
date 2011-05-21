require 'test_helper'

module DopisOnlineClient
  class DopisOnlineClientTest < Test::Unit::TestCase

    context "Client" do
      setup do
        DopisOnlineClient.base_uri 'http://mujdopisonline.cz/odeslat'
      end

      should "have base_url set" do
        assert_equal "http://mujdopisonline.cz/odeslat", DopisOnlineClient.base_uri
      end
    end

  end
end