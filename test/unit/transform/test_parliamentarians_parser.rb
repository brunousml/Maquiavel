require_relative '../../lib/parliamentarians/transform/rm/parser'
require_relative '../../lib/settings'
require 'test/unit'

# This unit test is related to Parliamentarians::Requester class
module TestParliamentarians
  class TestParser < Test::Unit::TestCase

    # Test get contact information from extract DB
    def test_parse_contact_information
      # Setup
      parser = Parliamentarians::Parser.new

      # Act
      contact_information = parser.get_contact

      # Assertion
      assert_not_nil(contact_information)
      # assert is founded email
      # assert is founded name
      # assert is founded phone
    end

    # Test get parliamentarians raw data from extract DB
    def test_get_parliamentarians_raw_from_extract_db
      # Setup
      parser = Parliamentarians::Parser.new

      # Act
      contact_information = parser.get_parliamentarians_raw

      # Assertion
      assert_not_nil(contact_information)
    end
  end
end