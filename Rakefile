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
rescue LoadError
end
require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Tire"
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

# Generate coverage reports
begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.rcov_opts = ['--exclude', 'gems/*']
    test.pattern = 'test/**/*_test.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install rcov"
  end
end
