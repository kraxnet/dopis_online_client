# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dopis_online_client/version"

Gem::Specification.new do |gem|
  gem.name        = "dopis_online_client"
  gem.version     = DopisOnlineClient::VERSION
  gem.authors     = ["Jiri Kubicek"]
  gem.email       = ["jiri.kubicek@kraxnet.cz"]
  gem.homepage    = "http://github.com/kraxnet/dopis_online_client"
  gem.summary     = %q{Dopis Online Client Library}
  gem.description = %q{Klientská knihovna pro práci se službou Dopis Online České pošty}

  gem.rubyforge_project = "dopis_online_client"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files  = [ "README.rdoc", "LICENSE" ]
  gem.rdoc_options      = [ "--charset=UTF-8" ]

  gem.required_rubygems_version = ">= 1.3.6"

  gem.add_dependency "rake",        ">= 0.8.0"
  gem.add_dependency "bundler",     ">= 1.0"
  gem.add_dependency "httmultiparty"
  gem.add_dependency "crack"

  gem.add_development_dependency "turn"
  gem.add_development_dependency "shoulda"
  gem.add_development_dependency "sdoc"
  gem.add_development_dependency "rcov"
  gem.add_development_dependency "fakeweb"
end
