# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dopis_online_client/version"

Gem::Specification.new do |s|
  s.name        = "dopis_online_client"
  s.version     = DopisOnlineClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jiri Kubicek"]
  s.email       = ["jiri.kubicek@kraxnet.cz"]
  s.homepage    = "http://github.com/kraxnet/dopis_online_client"
  s.summary     = %q{Dopis Online Client Library}
  s.description = %q{Klientská knihovna pro práci se službou Dopis Online České pošty}

  s.rubyforge_project = "dopis_online_client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
