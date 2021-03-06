require 'test/unit'
require_relative '../../lib/mongo_db_manager'
require_relative '../../lib/settings'

# This unit test is related to MongoDbManager class
module Test
  class TestMongoDbManager < Test::Unit::TestCase

    # Test the presence of mongo test settings
    def test_mongo_db_settings_test_is_not_empty
      assert_not_nil(MONGO_DB_SETTINGS['test']['name'])
      assert_not_nil(MONGO_DB_SETTINGS['test']['host'])
      assert_not_nil(MONGO_DB_SETTINGS['test']['port'])
    end

    # Test the presence of mongo production settings
    def test_mongo_db_settings_production_is_not_empty
      assert_not_nil(MONGO_DB_SETTINGS['production']['name'])
      assert_not_nil(MONGO_DB_SETTINGS['production']['host'])
      assert_not_nil(MONGO_DB_SETTINGS['production']['port'])
    end

    # Test the presence of mongo development settings
    def test_mongo_db_settings_development_is_not_empty
      assert_not_nil(MONGO_DB_SETTINGS['development']['name'])
      assert_not_nil(MONGO_DB_SETTINGS['development']['host'])
      assert_not_nil(MONGO_DB_SETTINGS['development']['port'])
    end

    # Test successful connection with mongo
    def test_connection_with_mongo
      # Setup
      db = MongoDbManager.new(MONGO_DB_SETTINGS['test'], :parliamentarians)

      # Assertion
      assert_not_nil(db)
      assert_equal(MongoDbManager, db.class)
    end

    # Test successful object saved in mongo
    def test_save
      # Setup
      db = MongoDbManager.new(MONGO_DB_SETTINGS['test'], :parliamentarians)
      hash_to_save = {'parliamentary' => 'teste'}

      # Act
      saved = db.insert(hash_to_save)

      # Assert
      assert_not_nil(saved)
    end

    # Test successful get object in mongo
    def test_get
      # Setup
      db = MongoDbManager.new(MONGO_DB_SETTINGS['test'], :parliamentarians)
      hash_to_save = {'parliamentary' => 'teste'}
      # Act
      db.insert(hash_to_save)
      found = db.get(hash_to_save)

      # Assert
      assert_not_nil(found)
    end

    # Test verify existence of :extract_parliamentarians collection
    def test_collection_extract_parliamentarians_exists
      # Setup
      db = MongoDbManager.new(MONGO_DB_SETTINGS['test'], :parliamentarians)
      hash_to_save = {'parliamentary' => 'teste'}

      # Act
      saved = db.insert(hash_to_save)
      collection = db.collection

      # Assert
      assert_not_nil(collection)
      assert_equal("parliamentarians", collection.name)
    end
  end
end