require_relative '../../lib/brazil/councilman/sp/extract/ct/extractor'
require "csv"

# This file is used to import councilman though command line
# Dependencies:
#   /lib/councilman/extract/extractor
#
# Execute command to use:
#   ruby bin/import_councilman_debits.rb

puts 'Importing councilman debits....'

extractor = SPCouncilman::Extractor.new
File.write("councilman.csv", extractor.data.map(&:to_csv).join)
puts data if ENV == 'development'


puts 'It\'s finished.'