require_relative '../../../../../lib/mysql_db_manager'
require_relative '../../../../../lib/settings'


# This class is used to connect with mysql and use transform collection
#
# Example of use:
#   db = SPCouncilman::DbTransform.new
#   db.insert(your_array_or_hash={}, "table_name")

module SPCouncilman
  class DbTransform < MysqlDbManager
    def initialize
      super(MYSQL_DB_SETTINGS[$env])
    end
  end
end