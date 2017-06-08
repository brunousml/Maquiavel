require 'mongo'

# This class is used to connect and interact with mongo
#
# Example of use:
#   db = MongoDbManager.new(EXTRACT_MONGO_DB_SETTINGS[env], :your-collection)
#   db.save('your-data-here')


class MongoDbManager
  attr_reader :collection

  def initialize(settings, collection)
    Mongo::Logger.logger.level = ::Logger::FATAL if $env == 'production'

    host = settings['host'] + ':' + settings['port']
    @client = Mongo::Client.new([host], :database => settings['name'])
    @collection = @client[collection]
  end

  def insert(doc, key=nil)
    to_save = key ? { key => doc } : doc
    result = @collection.insert_one(to_save)
    result
  end

  def get(key)
    @collection.find(key)
  end
end