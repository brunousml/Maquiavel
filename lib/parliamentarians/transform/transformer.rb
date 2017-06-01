require_relative 'db_transform'
require_relative 'parser'

# This class is used to parse and save transformed data from open data
# Dependencies:
#   db_transform
#   parser
#
# Example of use:
#   transformer = Parliamentarians::Transformer.new
#   transformer.save

module Parliamentarians
  class Transformer
    def initialize
      # Set up
      @parser = Parliamentarians::Parser.new
      @db = Parliamentarians::DbTransform.new
    end

    def save
      count = 0

      raw = @parser.get_parliamentarians_raw
      raw.each do |parliamentary|
        contact_information = @parser.get_contact(parliamentary)
        @db.insert(contact_information)
        count += 1
      end
      count
    end
  end
end

