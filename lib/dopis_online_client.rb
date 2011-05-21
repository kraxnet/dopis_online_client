require 'httparty'

require File.dirname(__FILE__) + '/dopis_online_client/request.rb'
require File.dirname(__FILE__) + '/dopis_online_client/response.rb'

module DopisOnlineClient

  def self.base_uri(path=nil)
    path ? @base_uri = path : @base_uri
  end

end

