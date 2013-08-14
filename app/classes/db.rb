#noinspection RubyResolve
class Db
  @@host = 'localhost'
  @@db_user = 'root'
  @@db_password = '123456'
  @@db_name = 'sofa'
  @conn = nil
  @stmt = nil

  def initialize(attributes={})
    @conn = Mysql.real_connect(@@host, @@db_user, @@db_password, @@db_name)
    @stmt = @conn.stmt_init()
  end

  def query(sql)
    result = @conn.query(sql)
  end

  def find(table, where, order = 'id desc')
    sql = "select * from #{table} where #{where} order by #{order} limit 1"
    result = @conn.query(sql)
    return nil if @conn.affected_rows == 0
    result.fetch_hash
  end

  def add(table, data = {})
    sql_data = {:key => [], :value => [], :place => []}
    data.each do |k, v|
      sql_data[:key].push(k)
      sql_data[:value].push("'#{v}'")
    end
    sql = "insert into #{table}(#{sql_data[:key].join(',')}) values (#{sql_data[:value].join(',')})"
    @conn.query(sql)
    @conn.affected_rows
  end

  def save(table, where, data = {})

  end
end