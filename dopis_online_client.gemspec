# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{dopis_online_client}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jiri Kubicek"]
  s.date = %q{2009-09-30}
  s.description = %q{Klientská knihovna pro práci se službou Dopis Online České pošty}
  s.email = %q{jiri.kubicek@kraxnet.cz}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/dopis_online_client.rb",
     "lib/dopis_online_client/request.rb",
     "lib/dopis_online_client/response.rb",
     "test/dopis_online_response_test.rb",
     "test/fixtures/failure.xml",
     "test/fixtures/success.xml",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/kraxnet/dopis_online_client}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Dopis Online Client Library}
  s.test_files = [
    "test/dopis_online_response_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
