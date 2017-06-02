require_relative '../../../lib/parliamentarians/extract/extractor'
require 'test/unit'

# This unit test is related to Parliamentarians::Extractor class
module TestParliamentarians
  class TestExtractor < Test::Unit::TestCase

    # Test dump successful dump of parliamentarians into mongo
    def test_dump
      # Setup
      ex = Parliamentarians::Extractor.new

      # Act
      result = ex.dump

      # Assertion
      assert_not_nil(result)
      assert(result.is_a?Hash)
    end
  end
end