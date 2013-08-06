#noinspection RubyResolve
class Db
  @@host = 'localhost'
  @@db_user = 'root'
  @@db_password = 'root'
  @@db_name = 'dc211_en'
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
    @stmt.prepare("insert into #{table}(name, addtime) values (?, ?)")
    @stmt.execute(data[:name], data[:addtime])
  end

  def save(table, where, data = {})

  end
end