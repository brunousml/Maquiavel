require_relative '../lib/parliamentarians/transform/rm/transformer'

# This file is used to import parliamentarians thouth command line
# Dependencies:
#   /lib/parliamentarians/transform/transformer
#
# Execute command to use:
#   ruby bin/parse_parliamentarians_contact.rb

puts 'Parsing parliamentarians contact information...'

parliamentarians = Parliamentarians::Transformer.new
data = parliamentarians.save_contact_information
puts data if ENV == 'development'


puts 'It\'s finished'