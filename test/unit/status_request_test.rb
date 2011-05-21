require 'test_helper'

module DopisOnlineClient
  class StatusRequestTest < Test::Unit::TestCase

    context "Request#deliver" do

      setup do
        FakeWeb.register_uri(:post, "https://online3.postservis.cz/cmdedopis/eprehledZak.php", :body => File.read(File.join(File.dirname(__FILE__),'../fixtures/status.xml')))
        DopisOnlineClient.base_uri 'https://online3.postservis.cz/cmdedopis'
        DopisOnlineClient.auth('jmeno','heslo')
        @response = DopisOnlineClient::StatusRequest.new(:date=>"20110521").deliver
      end

      should "return response" do
        assert_not_nil @response
      end

    end

  end
end