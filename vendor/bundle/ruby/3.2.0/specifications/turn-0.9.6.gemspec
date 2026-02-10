# -*- encoding: utf-8 -*-
# stub: turn 0.9.6 ruby lib

Gem::Specification.new do |s|
  s.name = "turn".freeze
  s.version = "0.9.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Thomas Sawyer".freeze, "Tim Pease".freeze]
  s.date = "2012-06-28"
  s.description = "Turn provides a set of alternative runners for MiniTest, both colorful and informative.".freeze
  s.email = ["transfire@gmail.com".freeze, "tim.pease@gmail.com".freeze]
  s.executables = ["turn".freeze]
  s.extra_rdoc_files = ["History.txt".freeze, "Version.txt".freeze, "LICENSE-GPL2.txt".freeze, "LICENSE-RUBY.txt".freeze, "LICENSE-MIT.txt".freeze, "Release.txt".freeze, "LICENSE.txt".freeze, "README.md".freeze]
  s.files = ["History.txt".freeze, "LICENSE-GPL2.txt".freeze, "LICENSE-MIT.txt".freeze, "LICENSE-RUBY.txt".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Release.txt".freeze, "Version.txt".freeze, "bin/turn".freeze]
  s.homepage = "http://rubygems.org/gems/turn".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.20".freeze
  s.summary = "Test Reporters (New) -- new output formats for Testing".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 3

  s.add_runtime_dependency(%q<ansi>.freeze, [">= 0"])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
end
