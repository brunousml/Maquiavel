require 'mysql2'
require 'net/ssh/gateway'

# This class is used to connect and interact with mysql
#
# Example of use:
#   db = MysqlDbManager.new(MYSQL_DB_SETTINGS)
#   db.save('your-data-here')


class MysqlDbManager

  def initialize(settings)
    port = settings[:port]
    if settings.has_key? :ssh
      port = ssh_connection(settings[:ssh])
    end

    @client = Mysql2::Client.new(
        :host => settings[:host],
        :username => settings[:user],
        :password => settings[:password],
        :port => port,
        :database => settings[:name],
        :connect_timeout => 9999
    )
  end

  def ssh_connection(settings={})
    gateway = Net::SSH::Gateway.new(
        settings[:host],
        settings[:user],
        :password => settings[:password])
    port = gateway.open('127.0.0.1', 3306, 3317)
    port
  end

  def query(query_string)
    result = @client.query(query_string)
    rows_affected(result)
  end

  def rows_affected(result)
    {
        :rows_affected => @client.affected_rows(),
        :result => result
    }
  end

  def create(object_to_save, table_name)
    columns = ''
    values = ''

    object_to_save.each do |k, v|
      # Add "," when add more than one
      columns.concat(', ') if columns != ''
      values.concat(', ') if values != ''

      # Default concat
      columns.concat(k.to_s)
      values.concat('"' + v.to_s + '"')
    end

    query_string = "INSERT INTO #{table_name} (#{columns}) VALUES (#{values});"
    query(query_string)
  end

  def get(where, table_name)
    where_string = ''

    where.each do |k, v|
      # Add "," when add more than one
      where_string.concat(' AND ') if where_string != ''

      # Default concat
      where_string.concat(k.to_s)
      where_string.concat('=')
      where_string.concat("'" + v.to_s + "'")
    end

    query_string = "SELECT * FROM #{table_name} WHERE #{where_string};"
    result = query(query_string)
  end


end