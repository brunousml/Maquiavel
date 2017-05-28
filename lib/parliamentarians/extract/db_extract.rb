require '../../mongo_db'
require '../../settings'

# This class is used to connect with mongo extract db
#
# Example of use:
#   @db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_DB_SETTINGS[env])
#   @db.save('your-data-here')

module Parliamentarians
  class DbExtract < DB
    def initialize
      host = EXTRACT_MONGO_DB_SETTINGS['host'] + ':' + EXTRACT_MONGO_DB_SETTINGS['port']
      @@client = Mongo::Client.new([host], :database => settings['name'])
      @collection = @@client[:parliamentarians]
    end
  end
end