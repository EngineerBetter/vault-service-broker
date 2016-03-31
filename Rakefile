require 'rake'
require 'dotenv/tasks' unless ENV['PLATFORM'] == "cf"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = Dir.glob('spec/**/*_spec.rb')
    t.rspec_opts = '--format documentation'
  end
rescue LoadError
end

task :default => :spec
