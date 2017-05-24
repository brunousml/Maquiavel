require_relative '../../../lib/settings'
require_relative 'db_extract'
require_relative 'requester'

# Parliamentarians Object
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

