require_relative '../../../lib/settings'
require_relative 'db_extract'
require_relative 'requester'

# This class is used to recovery parliamentarians data from open data
# and save json on mongo
# Dependencies:
#   db_extract
#   requester
#
# Example of use:
#   parliamentarians = Parliamentarians::Extractor.new(ENV)
#   data = parliamentarians.dump

module Parliamentarians
  class Extractor
    def initialize(env='development')
      # Set up
      @requester = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)
      @db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS[env])
    end

    def dump
      data = @requester.get
      @db.save(data)
      data
    end
  end
end

