# Suit of Tests
# This file is used to running all the unit tests
# Command:
#   ruby test/unit/test_parliamentarians.rb

# setup
$ENV = 'test'
require 'test/unit'
require_relative '../../lib/settings'

# Db Connection
require_relative 'test_mongo_db_manager'
require_relative 'test_mysql_db_manager'

# Parliamentarians
require_relative 'brazil/parliamentarians/test_parliamentarians'

# Councilman
require_relative 'brazil/councilman/sp/test_sp_councilman'