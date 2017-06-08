require_relative '../lib/parliamentarians/extract/ct/extractor'

# This file is used to import parliamentarians though command line
# Dependencies:
#   /lib/parliamentarians/extract/extractor
#
# Execute command to use:
#   ruby bin/import_parliamentarians.rb

puts 'Importing Parliamentarians....'

parliamentarians = Parliamentarians::Extractor.new
data = parliamentarians.dump
puts data if ENV == 'development'


puts 'It\'s finished.'