require 'test_helper'

module DopisOnlineClient
  class DopisOnlineClientTest < Test::Unit::TestCase

    context "Client" do
      setup do
        DopisOnlineClient.base_uri 'http://mujdopisonline.cz/odeslat'
        DopisOnlineClient.auth("mojejmeno", "mojeheslo")
      end

      should "have base_url set" do
        assert_equal "http://mujdopisonline.cz/odeslat", DopisOnlineClient.base_uri
      end

      should "have username set" do
        assert_equal "mojejmeno", DopisOnlineClient.username
      end

      should "have password set" do
        assert_equal "mojeheslo", DopisOnlineClient.password
      end
    end

  end
end
