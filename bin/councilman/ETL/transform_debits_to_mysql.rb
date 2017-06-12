require_relative '../../../lib/brazil/councilman/sp/transform/transformer'

# This file is used to import councilman though command line
# Dependencies:
#   lib/brazil/councilman/sp/transform/transformer
#
# Execute command to use:
#   ruby bin/transform_debits_to_mysql.rb

puts 'Transforming councilman debits....'

# Setup
transformer = SPCouncilman::Transformer.new

# Act
data = transformer.save_debits
puts data.length.to_s + ' Debits transformed'
