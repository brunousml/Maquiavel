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
    def initialize
      # Set up
      @requester = Parliamentarians::Requester.new(OPEN_DATA_URLS['brazil']['parliamentarians'])
      @db = Parliamentarians::DbExtract.new
    end

    def dump
      parliamentarians = @requester.get
      version = parliamentarians['ListaParlamentarEmExercicio']['Metadados']['Versao']
      data = { :version => version, :parliamentarians => parliamentarians }

      @db.insert(data)
      data
    end
  end
end

