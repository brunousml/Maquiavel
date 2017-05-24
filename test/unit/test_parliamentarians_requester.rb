require_relative '../../lib/parliamentarians/extract/requester'
require_relative '../../bin/settings'
require 'test/unit'

module TestParliamentarians
  class TestRequester < Test::Unit::TestCase
    def test_get
      # Setup
      req = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)

      # Act
      parliamentarians = req.get

      # Assertion
      assert_not_nil(parliamentarians)
    end

    def test_get_json_raw
      # Setup
      req = Parliamentarians::Requester.new(PARLIAMENTARIANS_URL)

      # Act
      body = req.get_json_raw

      # Assertion
      assert_not_nil(body)
    end

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