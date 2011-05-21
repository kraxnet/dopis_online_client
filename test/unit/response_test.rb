require 'test_helper'

module DopisOnlineClient
  class ResponseTest < Test::Unit::TestCase

    should "parse success correctly" do
      response = load_response_from_file("success.xml")

      assert_equal 200,   response.code
      assert_equal true,  response.success?

      assert_equal 0,     response.failure_code
      assert_nil          response.failure_message

      assert_equal "testing.pdf",             response.filename
      assert_equal 1,                         response.pages_count
      assert_equal 20090608050001,            response.order_code
      assert_equal "",                        response.tracking_number
  #    assert_equal Date.parse("2009-06-08"),  response.success_result["datumpodani"]
      assert_not_nil                          response.price
      assert_equal false,                     response.color
      assert_equal 67,                        response.shipping_method
    end

    should "parse failure correctly" do
      response = load_response_from_file("failure.xml")

      assert_equal 200,   response.code
      assert_equal false, response.success?
      assert_equal 8,     response.failure_code
      assert_not_nil      response.failure_message
    end

    def load_response_from_file(filename)
      body = File.read(File.join(File.dirname(__FILE__),'../fixtures',filename))
      parsed_response = Crack::XML.parse(body)
      DopisOnlineClient::Response.new(parsed_response, body, 200)
    end

  end
end
