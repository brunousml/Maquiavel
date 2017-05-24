require 'mongo'

# This class is used to connect with mongo
#
# Example of use:
#   @db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS[env])
#   @db.save('your-data-here')

module Parliamentarians
  class DbExtract
    def initialize(settings)
      host = [settings['host'] + ':' + settings['port']]
      @@client = Mongo::Client.new(host, :database => settings['name'])
      @collection = @@client[:parliamentarians]
    end

    def save(doc)
      result = @collection.insert_one(doc)
      result.n
    end

    def get(search)
      @collection.find(search).first
    end
  end
end