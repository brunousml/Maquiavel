require_relative '../mongo_db_manager'
require_relative '../../settings'

# This class is used to connect with mongo extract db
#
# Example of use:
#   db = Parliamentarians::DbExtract.new
#   db.save('your-data-here')

module Parliamentarians
  class DbExtract < MongoDbManager
    def initialize
      super(MONGO_DB_SETTINGS[$env], :extract_parliamentarians)
    end
  end
end