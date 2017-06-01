require_relative '../../../lib/parliamentarians/transform/parser'
require_relative '../../../lib/settings'
require 'test/unit'

# This unit test is related to Parliamentarians::Requester class
module TestParliamentarians
  class TestParser < Test::Unit::TestCase

    # Test get parliamentarians raw data from extract DB
    def test_get_parliamentarians_raw_from_extract_db
      # Setup
      parser = Parliamentarians::Parser.new

      # Act
      raw = parser.get_parliamentarians_raw

      # Assertion
      assert_not_nil(raw)
      assert_equal(81, raw.length)
    end

    # Test get contact information from extract DB
    def test_parse_contact_information
      # Setup
      parser = Parliamentarians::Parser.new

      # Act
      parliamentarians = parser.get_parliamentarians_raw
      contact_information = parser.get_contact(parliamentarians[0])

      # Assertion
      assert_not_nil(contact_information)
      assert_true(contact_information.has_key?(:email))
      assert_true(contact_information.has_key?(:name))
      assert_true(contact_information.has_key?(:photo))
      assert_true(contact_information.has_key?(:uf))
      assert_true(contact_information.has_key?(:party))
    end


  end
end