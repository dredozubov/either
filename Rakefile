$LOAD_PATH << File.expand_path('./lib')
require "either"

task :build do
  system "gem build either.gemspec"
end

task :release => :build do
  system "gem push either-#{Either::VERSION}"
end

task :console do
  require 'pry'
  require 'either'
  ARGV.clear
  Pry.start
end
task :c => :console

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.libs << "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end
task :spec => :test
task :default => :test
