require 'bundler/gem_tasks'

task :default => :test

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.test_files = FileList['test/unit/*_test.rb', 'test/integration/*_test.rb']
  test.verbose = true
  # test.warning = true
end

namespace :test do
  Rake::TestTask.new(:unit) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/unit/*_test.rb'
    test.verbose = true
  end
  Rake::TestTask.new(:integration) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/integration/*_test.rb'
    test.verbose = true
  end
end

# Generate documentation
begin
  require 'sdoc'
  require 'rdoc/task'
  RDoc::Task.new do |rdoc|
    rdoc.rdoc_dir = 'rdoc'
    rdoc.title = "DopisOnlineClient"
    rdoc.rdoc_files.include('README.md')
    rdoc.rdoc_files.include('lib/**/*.rb')
  end
rescue LoadError
  # sdoc not available
end
