require_relative '../../../../../lib/brazil/parliamentarians/transform/db_transform'
require 'test/unit'

# This unit test is related to Parliamentarians::DbTransform class
module TestParliamentarians
  class TestDbTransform < Test::Unit::TestCase
    # Test successful connection with mongo
    def test_connection
      # Setup
      db = Parliamentarians::DbTransform.new

      # Assertion
      assert_not_nil(db)
      assert_equal(Parliamentarians::DbTransform, db.class)
    end

    # Test verify existence of :transform_parliamentarians collection
    def test_collection_extract_parliamentarians_exists
      # Setup
      db = Parliamentarians::DbTransform.new

      # Assert
      assert_equal("transform_parliamentarians", db.collection.name)
    end
  end
end