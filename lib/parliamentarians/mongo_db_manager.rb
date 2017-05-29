require 'mongo'
require 'json'

# This class is used to connect and interact with mongo
#
# Example of use:
#   db = Parliamentarians::MongoDbManager.new(EXTRACT_MONGO_DB_SETTINGS[env], :your-collection)
#   db.save('your-data-here')

module Parliamentarians
  class MongoDbManager
    attr_reader :collection

    def initialize(settings, collection)
      host = settings['host'] + ':' + settings['port']
      @client = Mongo::Client.new([host], :database => settings['name'])
      @collection = @client[collection]
    end

    def insert(doc)
      result = @collection.insert_one(doc)
      result.n
    end

    def get(key)
      @collection.find(key).first
    end
  end
end