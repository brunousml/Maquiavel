require_relative '../../lib/parliamentarians/extract/extractor'
require_relative '../../bin/settings'
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
      assert_equal(1, result)
    end
  end
end