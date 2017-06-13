require_relative '../../../../../../lib/brazil/councilman/sp/transform/db_transform'
require 'test/unit'

# This unit test is related to SPCouncilman::DbTransform class
module TestSPCouncilman
  class TestDbTransform < Test::Unit::TestCase
    # Test successful connection with mysql
    def test_connection
      # Setup
      db = SPCouncilman::DbTransform.new

      # Assertion
      assert_not_nil(db)
      assert_equal(SPCouncilman::DbTransform, db.class)
    end
  end
end