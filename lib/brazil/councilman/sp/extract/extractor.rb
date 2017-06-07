require_relative 'db_extract'
require_relative 'requester'
require "csv"

# This class is used to recovery councilman data from open data
# and save json on mongo
# Dependencies:
#   db_extract
#   requester
#
# Example of use:
#   councilman = Councilman::Extractor.new(ENV)
#   data = councilman.dump

module SPCouncilman
  class Extractor
    def initialize
      # Set up
      @requester = SPCouncilman::Requester.new(OPEN_DATA_URLS['brazil']['councilman']['sp']['debits'])
      @db = SPCouncilman::DbExtract.new
    end

    def dump_debit
      data = @requester.get_debits
      data.each do |el|
        el.each do |x|
          @db.insert(x)
        end
      end
    end

    def dump_to_csv
      data = @requester.get_debits
      File.write("councilman.csv", data.map(&:to_csv).join)
      data
    end
  end
end

