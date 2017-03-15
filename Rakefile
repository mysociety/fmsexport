$:.unshift File.join File.dirname(__FILE__), 'lib'

require 'rspec/core/rake_task'
require 'fmsexport'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc "Export data as a CSV"
task :export do
  if ENV['COUNCIL'].nil?
    puts "Please specify a council using the COUNCIL env var"
    exit 1
  else
    council = ENV['COUNCIL']
    options = {
      category: ENV['CATEGORY'],
      area: ENV['AREA'],
      state: ENV['STATE'],
    }
    puts Fmsexport::Report.generate(council, options)
  end
end
