# Suit of Tests
# This file is used to running all the unit tests
# Command:
#   ruby test/unit/test_parliamentarians.rb

require 'test/unit'
require_relative '../../lib/settings'
require_relative 'extract/test_parliamentarians_db_extract'
require_relative 'extract/test_parliamentarians_requester'
require_relative 'extract/test_parliamentarians_extractor'
