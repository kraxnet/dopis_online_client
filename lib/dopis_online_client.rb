begin
  require 'rubygems'
  gem 'crack'
  require 'crack'
#  raise LoadError, "You must have crack installed"
end

module DopisOnlineClient
end

require File.dirname(__FILE__) + '/dopis_online_client/request.rb'
require File.dirname(__FILE__) + '/dopis_online_client/response.rb'