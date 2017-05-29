require_relative '../../../lib/parliamentarians/extract/db_extract'
require 'test/unit'

# This unit test is related to Parliamentarians::MongoDbManager class
module TestParliamentarians
  class TestDbExtract < Test::Unit::TestCase
    # Test successful connection with mongo
    def test_connection
      # Setup
      db = Parliamentarians::DbExtract.new

      # Assertion
      assert_not_nil(db)
    end

    # Test verify existence of :extract_parliamentarians collection
    def test_collection_extract_parliamentarians_exists
      # Setup
      db = Parliamentarians::DbExtract.new

      # Assert
      assert_equal("extract_parliamentarians", db.collection.name)
    end
  end
end