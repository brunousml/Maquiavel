require 'mongo'

module Parliamentarians
  class DbExtract
    def initialize(extract_mongo_settings)
      host = [extract_mongo_settings['host'] + ':' + extract_mongo_settings['port']]
      client = Mongo::Client.new(host, :database => extract_mongo_settings['name'])
      @@collection = client[:parliamentarians]
    end

    def save(doc)
      result = @@collection.insert_one(doc)
      result.n
    end

    def get(search)
      @@collection.find(search).first
    end
  end
end