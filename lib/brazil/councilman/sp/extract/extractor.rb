require_relative 'db_extract'
require_relative 'requester'

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
    attr_reader :data

    def initialize
      # Set up
      @requester = SPCouncilman::Requester.new(OPEN_DATA_URLS['brazil']['councilman']['sp']['debits'])
      @db = SPCouncilman::DbExtract.new
    end

    def dump_debit
      # Setup
      data = @requester.get_debits
      time = Time.now.getutc

      # ACT
      @db.insert({:time => time, :debits => data})

      # Return
      data
    end
  end
end

