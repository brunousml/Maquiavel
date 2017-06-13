require 'test/unit'
require_relative '../../lib/mysql_db_manager'
require_relative '../../lib/settings'

# This unit test is related to MongoDbManager class
module Test
  class TestMysqlDbManager < Test::Unit::TestCase

    # Test the presence of mysql test settings
    def test_mysql_db_settings_test_is_not_empty
      assert_not_nil(MYSQL_DB_SETTINGS['test']['name'])
      assert_not_nil(MYSQL_DB_SETTINGS['test']['host'])
      assert_not_nil(MYSQL_DB_SETTINGS['test']['port'])
      assert_not_nil(MYSQL_DB_SETTINGS['test']['username'])
      assert_not_nil(MYSQL_DB_SETTINGS['test']['password'])
    end

    # Test the presence of mysql production settings
    def test_mysql_db_settings_production_is_not_empty
      assert_not_nil(MYSQL_DB_SETTINGS['production']['name'])
      assert_not_nil(MYSQL_DB_SETTINGS['production']['host'])
      assert_not_nil(MYSQL_DB_SETTINGS['production']['port'])
      assert_not_nil(MYSQL_DB_SETTINGS['production']['username'])
      assert_not_nil(MYSQL_DB_SETTINGS['production']['password'])
    end

    # Test the presence of mysql development settings
    def test_mysql_db_settings_development_is_not_empty
      assert_not_nil(MYSQL_DB_SETTINGS['development']['name'])
      assert_not_nil(MYSQL_DB_SETTINGS['development']['host'])
      assert_not_nil(MYSQL_DB_SETTINGS['development']['port'])
      assert_not_nil(MYSQL_DB_SETTINGS['development']['username'])
      assert_not_nil(MYSQL_DB_SETTINGS['development']['password'])
    end

    # Test successful connection with mysql
    def test_connection_with_mysql
      # Setup
      mdm = MysqlDbManager.new(MYSQL_DB_SETTINGS['test'])

      # Assertion
      assert_not_nil(mdm)
      assert_equal(MysqlDbManager, mdm.class)
    end

    # Test successful object query in mysql
    def test_query
      # Setup
      mysql = MysqlDbManager.new(MYSQL_DB_SETTINGS['test'])
      query_string = 'SELECT 1, 2, 3'

      # Act
      result = mysql.query(query_string)

      # Assert
      assert_not_nil(result)
      assert_equal(1, result.count)
    end

    # Test successful save object in mongo
    def test_save
      # Setup
      mysql = MysqlDbManager.new(MYSQL_DB_SETTINGS['test'])
      object_to_save = {
          'name' => 'Severino Braga',
          'email' => 'Sev.Bra@test.com'
      }

      # Act
      result = mysql.save(object_to_save, 'test')

      # Assert
      assert_not_nil(result)
      assert_equal(1, result['rows_affected'])
    end

  end
end