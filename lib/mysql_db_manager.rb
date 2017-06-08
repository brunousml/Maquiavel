require 'mysql2'

# This class is used to connect and interact with mysql
#
# Example of use:
#   db = MysqlDbManager.new(MYSQL_DB_SETTINGS)
#   db.save('your-data-here')


class MysqlDbManager

  def initialize(settings)
    @client = Mysql2::Client.new(
        :host => settings['host'],
        :username => settings['username'],
        :password => settings['password'],
        :port => settings['port'],
        :database => settings['name']
    )
  end

  def query(query_string)
    data = @client.query(query_string)
    rows_affected
  end

  def save(object_to_save, table_name)
    columns = ''
    values = ''

    object_to_save.each do |k, v|
      # Add "," when add more than one
      columns.concat(', ') if columns != ''
      values.concat(', ') if values != ''

      # Default concat
      columns.concat(k)
      values.concat("'" + v + "'")
    end

    query_string = "INSERT INTO #{table_name} (#{columns}) VALUES (#{values});"
    query(query_string)
  end

  def rows_affected
    {'rows_affected' => @client.affected_rows()}
  end
end