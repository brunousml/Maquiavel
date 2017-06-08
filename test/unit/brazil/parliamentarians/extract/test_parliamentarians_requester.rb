require_relative '../../../../../lib/brazil/parliamentarians/extract/requester'
require_relative '../../../../../lib/settings'
require 'test/unit'

# This unit test is related to Parliamentarians::Requester class
module TestParliamentarians
  class TestRequester < Test::Unit::TestCase

    # Test get information from opendata
    def test_get
      # Setup
      req = Parliamentarians::Requester.new(OPEN_DATA_URLS['brazil']['parliamentarians'])

      # Act
      parliamentarians = req.get

      # Assertion
      assert_not_nil(parliamentarians)
    end

    # Test get information from opendata in json raw
    def test_get_json_raw
      # Setup
      req = Parliamentarians::Requester.new(OPEN_DATA_URLS['brazil']['parliamentarians'])

      # Act
      body = req.get_json_raw

      # Assertion
      assert_not_nil(body)
    end

    # Test length of parliamentarians returned from open data
    def test_length
      # Setup
      req = Parliamentarians::Requester.new(OPEN_DATA_URLS['brazil']['parliamentarians'])

      # Act
      result = req.length

      # Assertion
      assert_equal(81, result)
    end
  end
end