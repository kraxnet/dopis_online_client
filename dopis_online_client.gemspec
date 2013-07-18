# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dopis_online_client/version"

Gem::Specification.new do |s|
  s.name        = "dopis_online_client"
  s.version     = DopisOnlineClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jiri Kubicek", "Josef Pospisil"]
  s.email       = ["jiri.kubicek@kraxnet.cz", "josef.pospisil@laststar.eu"]
  s.homepage    = "http://github.com/kraxnet/dopis_online_client"
  s.summary     = %q{Dopis Online Client Library}
  s.description = %q{Klientská knihovna pro práci se službou Dopis Online České pošty}

  gem.rubyforge_project = "dopis_online_client"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.extra_rdoc_files  = [ "README.rdoc", "LICENSE" ]
  gem.rdoc_options      = [ "--charset=UTF-8" ]

  gem.required_rubygems_version = ">= 1.3.6"

  s.add_dependency "rake",        ">= 0.8.0"
  s.add_dependency "bundler",     ">= 1.0"
  s.add_dependency "httmultiparty"
  s.add_dependency "multi_xml"
  s.add_dependency "builder"

  s.add_development_dependency "turn"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "sdoc"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "fakeweb"
end
