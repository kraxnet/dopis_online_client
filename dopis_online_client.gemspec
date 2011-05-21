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

  s.extra_rdoc_files  = [ "README.rdoc", "LICENSE" ]
  s.rdoc_options      = [ "--charset=UTF-8" ]

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rake",        "~> 0.8.0"
  s.add_dependency "bundler",     "~> 1.0.0"
  s.add_dependency "httmultiparty"

  s.add_development_dependency "turn"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "sdoc"
  s.add_development_dependency "rcov"
  s.add_development_dependency "fakeweb"
end
