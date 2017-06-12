require_relative '../../../../../../lib/brazil/councilman/sp/extract/db_extract'
require 'test/unit'

# This unit test is related to SPCouncilman::DbExtract class
module TestSPCouncilman
  class TestDbExtract < Test::Unit::TestCase
    # Test successful connection with mongo
    def test_connection
      # Setup
      db = SPCouncilman::DbExtract.new

      # Assertion
      assert_not_nil(db)
    end

    # Test verify existence of :extract_councilman collection
    def test_collection_extract_councilman_exists
      # Setup
      db = SPCouncilman::DbExtract.new

      # Assert
      assert_equal("extract_councilman", db.collection.name)
    end

    def test_get_debits
      # Setup
      db = SPCouncilman::DbExtract.new

      # ACT
      debits = db.get_debits

      # Assert
      assert_equal("extract_councilman", db.collection.name)
    end
  end
end