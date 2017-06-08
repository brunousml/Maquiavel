require_relative '../../../../../../lib/brazil/councilman/sp/extract/requester'
require_relative '../../../../../../lib/settings'
require 'test/unit'

# This unit test is related to SPCouncilman::Requester class
module TestSPCouncilman
  class TestRequester < Test::Unit::TestCase

    # Test get all debits from opendata
    def test_get_all_debits
      # Setup
      debits_url = OPEN_DATA_URLS['brazil']['councilman']['sp']['debits']
      req = SPCouncilman::Requester.new(debits_url)

      # Act
      debits = req.get_debits

      # Assertion
      assert_not_nil(debits)
      assert_equal(debits_url, req.base_url)
    end
  end
end