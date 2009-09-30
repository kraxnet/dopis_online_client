require 'test_helper'

class DopisOnlineResponseTest < Test::Unit::TestCase
  
  should "parse success correctly" do
    response = load_response_from_file("success.xml")
    
    response.code.should == 200
    response.success?.should == true
    
    response.failure_code.should == 0
    response.failure_message.should == nil
    
    response.filename.should == "testing.pdf"
    response.pages_count.should == 1
    response.order_code.should == 20090608050001
    response.tracking_number.should == ""
    response.datumpodani.should == Date.parse("2009-06-08")
    response.price.should_not == nil
    response.color.should == false
    response.shipping_method.should == 67
  end

  should "parse failure correctly" do
    response = load_response_from_file("failure.xml")

    response.code.should == 200
    response.success?.should == false
    response.failure_code.should == 8
    response.failure_message.should_not == nil
  end

  def load_response_from_file(filename)
    body = File.read(File.join(File.dirname(__FILE__),'fixtures',filename))
    parsed_response = Crack::XML.parse(body)
    DopisOnlineClient::Response.new(parsed_response, body, 200)
  end
end
