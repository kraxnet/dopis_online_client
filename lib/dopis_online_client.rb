require 'httmultiparty'

require 'dopis_online_client/request'
require 'dopis_online_client/response'
require 'dopis_online_client/status_request'

module DopisOnlineClient

  # Public: Sets the service uri
  #
  # uri - string with base uri of the service
  #
  def self.base_uri(path = nil)
    path ? @base_uri = path : @base_uri
  end

  # Public: Sets authentication credentials
  #
  # username - string with username
  # password - password
  #
  def self.auth(username, password)
    @username = username
    @password = password
  end

  # Public: Gets the current username
  #
  # Returns string with the username
  #
  def self.username
    @username
  end

  # Public: Gets the current password
  #
  # Returns string with the password
  #
  def self.password
    @password
  end
end

