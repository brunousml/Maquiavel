require_relative '../../../../../../lib/brazil/councilman/sp/transform/transformer'
require 'test/unit'

# This unit test is related to SPCouncilman::Transformer class
module TestSPCouncilman
  class TestTransformer < Test::Unit::TestCase

    # Test save data transformed into db
    def test_save_debits
      # Setup
      transformer = SPCouncilman::Transformer.new

      # Act
      saved_number = transformer.save_debits

      # Assertion
      assert_not_nil(saved_number)
      assert_equal(81, saved_number)
    end
  end
end