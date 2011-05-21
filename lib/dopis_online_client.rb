require 'httmultiparty'

require 'dopis_online_client/request'
require 'dopis_online_client/response'
require 'dopis_online_client/status_request'

module DopisOnlineClient

  def self.base_uri(path=nil)
    path ? @base_uri = path : @base_uri
  end

  def self.auth(username, password)
    @username=username
    @password=password
  end

  def self.username
    @username
  end

  def self.password
    @password
  end

end

