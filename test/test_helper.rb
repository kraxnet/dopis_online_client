require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'turn' unless ENV["TM_FILEPATH"]

require 'dopis_online_client'

require "fakeweb"

FakeWeb.allow_net_connect = false
