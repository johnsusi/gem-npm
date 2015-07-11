require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc "Build the gem"
task :build do
  fail unless system("gem build npm.gemspec")
end

desc "Clean temporary files and build artifacts"
task :clean do
  FileUtils.rm_rf [Dir.glob('*.gem'), 'tmp', 'build']
end

task :default => [:build, :test]
