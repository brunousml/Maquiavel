require_relative '../../../lib/parliamentarians/transform/transformer'
require_relative '../../../lib/settings'
require 'test/unit'

# This unit test is related to Parliamentarians::Transformer class
module TestParliamentarians
  class TestTransformer < Test::Unit::TestCase

    # Test save data transformed into db
    def test_save
      # Setup
      transformer = Parliamentarians::Transformer.new

      # Act
      saved_number = transformer.save_contact_information

      # Assertion
      assert_not_nil(saved_number)
      assert_equal(81, saved_number)
    end
  end
end