require_relative '../../../mongo_db_manager'
require_relative '../../../../lib/settings'

# This class is used to connect with mongo extract db
#
# Example of use:
#   db = Councilman::DbExtract.new
#   db.save('your-data-here')

module Councilman
  class DbExtract < MongoDbManager
    def initialize
      super(MONGO_DB_SETTINGS[$env], :extract_councilman)
    end
  end
end