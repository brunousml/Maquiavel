require_relative '../../../bin/settings'
require_relative 'db_extract'
require_relative 'requester'

# Parliamentarians Object
module Parliamentarians
  class Extractor
    def initialize
      # Set up
      @@requester = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)
      @@db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS['development'])
    end

    def dump
      data = @@requester.get
      @@db.save(data)
    end
  end
end

