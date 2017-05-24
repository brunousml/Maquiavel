require_relative '../lib/parliamentarians/extract/extractor'
require_relative '../lib/settings'

# This file is used to import parliamentarians thouth command line
# Dependencies:
#   /lib/parliamentarians/extract/extractor
#   /lib/settings
#
# Execute command to use:
#   ruby bin/importParliamentarians.rb

puts "Started"
parliamentarians = Parliamentarians::Extractor.new(ENV)
data = parliamentarians.dump
puts data if ENV == 'development'
puts "Finished"