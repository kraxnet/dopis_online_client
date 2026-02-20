require 'rubygems'
require 'test/unit'
require 'shoulda'

require 'webmock/test_unit'
require 'multi_xml'

$LOAD_PATH.unshift "lib"

require 'dopis_online_client'

# Compatibility fix for httmultiparty with modern multipart-post
require 'multipart/post/parts'
require 'multipart/post/composite_read_io'
module HTTMultiParty
  module Multipartable
    Parts = Multipart::Post::Parts unless defined?(Parts)
    CompositeReadIO = Multipart::Post::CompositeReadIO unless defined?(CompositeReadIO)
  end
end
