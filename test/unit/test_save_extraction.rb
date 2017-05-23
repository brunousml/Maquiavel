require_relative '../../lib/parliamentarians/extract/db_extract'
require_relative '../../bin/settings'
require 'test/unit'

module TestParliamentarians
  class TestParliamentariansDB < Test::Unit::TestCase
    def test_db_extract_settings_is_not_empty
      assert_not_nil(EXTRACT_MONGO_SETTINGS['name'])
      assert_not_nil(EXTRACT_MONGO_SETTINGS['host'])
      assert_not_nil(EXTRACT_MONGO_SETTINGS['port'])
    end

    def test_connection_with_mongo_extract
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS)

      # Assertion
      assert_not_nil(extract_db)
    end

    def test_save
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS)
      hash_to_save = {'parliamentary' => 'teste'}

      # Act
      saved = extract_db.save(hash_to_save)

      # Assert
      assert_not_nil(saved)
      assert_equal(1, saved)
    end

    def test_get
      # Setup
      extract_db = Parliamentarians::DbExtract.new(EXTRACT_MONGO_SETTINGS)

      # Act
      found = extract_db.get({parliamentary:'teste'})

      # Assert
      assert_not_nil(found)
    end
  end
end