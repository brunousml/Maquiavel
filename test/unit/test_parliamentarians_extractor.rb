require_relative '../../lib/parliamentarians/extract/extractor'
require_relative '../../lib/settings'
require 'test/unit'

module TestParliamentarians
  class TestExtractor < Test::Unit::TestCase
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