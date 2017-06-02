require 'mongo'
require_relative '../../settings'
require_relative '../mongo_db_manager'


# This class is used to connect with mongo and use transform collection
#
# Example of use:
#   db = Parliamentarians::DbTransform.new
#   db.save('your-data-here')

module Parliamentarians
  class DbTransform < MongoDbManager
    def initialize
      super(MONGO_DB_SETTINGS[$env], :transform_parliamentarians)
    end
  end
end