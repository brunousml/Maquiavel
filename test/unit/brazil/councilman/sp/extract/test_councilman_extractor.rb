require_relative '../../../../../../lib/brazil/councilman/sp/extract/extractor'
require 'test/unit'

# This unit test is related to SPCouncilman::Extractor class
module TestSPCouncilman
  class TestExtractor < Test::Unit::TestCase

    # Test dump successful debits councilman
    def test_dump_debits_to_database
      # Setup
      ex = SPCouncilman::Extractor.new

      # Act
      result = ex.dump_debit

      # Assertion
      assert_not_nil(result)
      assert(ex.data.is_a?Array)
    end
  end
end