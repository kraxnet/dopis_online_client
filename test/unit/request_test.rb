require 'test_helper'

module DopisOnlineClient
  class RequestTest < Test::Unit::TestCase

    context "Request#deliver" do
      setup do
        FakeWeb.register_uri(:post, "https://online3.postservis.cz/dopisonline/donApi.php",
                             :body => File.read(File.join(File.dirname(__FILE__), '../fixtures/success.xml')))

        DopisOnlineClient.base_uri 'https://online3.postservis.cz/dopisonline/donApi.php'
        DopisOnlineClient.auth('jmeno', 'heslo')
        @filename = File.join(File.dirname(__FILE__), '../fixtures/letter.pdf')
        @request = DopisOnlineClient::Request.new(@filename)
      end

      should "set default options for sending" do
        assert_equal 195, @request.options.postage_type
        assert_equal 0, @request.options.coupon_type
        assert_equal 0, @request.options.print_type
        assert_equal 2, @request.options.sender_type
        assert_equal 2, @request.options.recipient_type
        assert_equal :xml, @request.options.format
      end

      should "set pdf_file_path" do
        assert_equal @filename, @request.pdf_file_path
      end

      should "return DopisOnlineClient::Response" do
        assert DopisOnlineClient::Response === @request.deliver
      end
    end
  end
end

