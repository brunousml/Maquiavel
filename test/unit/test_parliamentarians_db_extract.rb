require_relative '../../lib/parliamentarians/extract/db_extract'
require_relative '../../lib/settings'
require 'test/unit'

# This unit test is related to Parliamentarians::DbExtract class
module TestParliamentarians
  class TestDbExtract < Test::Unit::TestCase

    # Test the presence of mongo test settings
    def test_db_extract_settings_is_not_empty
      assert_not_nil(EXTRACT_MONGO_SETTINGS['test']['name'])
      assert_not_nil(EXTRACT_MONGO_SETTINGS['test']['host'])
      assert_not_nil(EXTRACT_MONGO_SETTINGS['test']['port'])
    end

    # Test successful connection with mongo
    def test_connection_with_mongo_extract
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS['test'])

      # Assertion
      assert_not_nil(extract_db)
    end

    # Test successful object saved in mongo
    def test_save
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS['test'])
      hash_to_save = {'parliamentary' => 'teste'}

      # Act
      saved = extract_db.save(hash_to_save)

      # Assert
      assert_not_nil(saved)
      assert_equal(1, saved)
    end

    # Test successful get object in mongo
    def test_get
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS['test'])
      hash_to_save = {'parliamentary' => 'teste'}
      # Act
      extract_db.save(hash_to_save)
      found = extract_db.get(hash_to_save)

      # Assert
      assert_not_nil(found)
    end
  end
end