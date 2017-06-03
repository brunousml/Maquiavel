require_relative '../../lib/councilman/sp/extract/extractor'

# This file is used to import councilman though command line
# Dependencies:
#   /lib/councilman/extract/extractor
#
# Execute command to use:
#   ruby bin/import_councilman_debits.rb

puts 'Importing councilman debits....'

extractor = Councilman::Extractor.new
data = extractor.get_csv
puts data if ENV == 'development'


puts 'It\'s finished.'