require_relative '../../lib/parliamentarians/extract/requester'
require_relative '../../lib/settings'
require 'test/unit'

# This unit test is relational to Parliamentarians::Requester class
module TestParliamentarians
  class TestRequester < Test::Unit::TestCase

    # Test get information from opendata
    def test_get
      # Setup
      req = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)

      # Act
      parliamentarians = req.get

      # Assertion
      assert_not_nil(parliamentarians)
    end

    # Test get information from opendata in json raw
    def test_get_json_raw
      # Setup
      req = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)

      # Act
      body = req.get_json_raw

      # Assertion
      assert_not_nil(body)
    end

    # Test length of parliamentarians returned from open data
    def test_length
      # Setup
      req = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)

      # Act
      result = req.length

      # Assertion
      assert_equal(81, result)
    end
  end
end