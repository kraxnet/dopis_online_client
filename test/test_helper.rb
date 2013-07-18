require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'turn' unless ENV["TM_FILEPATH"]

require "fakeweb"

$LOAD_PATH.unshift "lib"

require 'dopis_online_client'

FakeWeb.allow_net_connect = false
