require 'test_helper'

module DopisOnlineClient
  class RequestTest < Test::Unit::TestCase

    context "Request#deliver" do

      setup do
        FakeWeb.register_uri(:post, "https://online3.postservis.cz/cmdedopis/dopisonline.php", :body => File.read(File.join(File.dirname(__FILE__), '../fixtures/success.xml')))

        DopisOnlineClient.base_uri 'https://online3.postservis.cz/cmdedopis'
        DopisOnlineClient.auth('jmeno', 'heslo')
        @request = DopisOnlineClient::Request.new(:pdf_file_path => File.join(File.dirname(__FILE__), '../fixtures/letter.pdf'))
      end

      should "return DopisOnlineClient::Response" do
        assert DopisOnlineClient::Response === @request.deliver
      end

    end

  end
end
