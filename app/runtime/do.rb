exit if defined?(ENTRANCE).nil? || defined?(APP_NAME).nil?
# 加载常用类
require 'mysql'
require 'json'
require './app/classes/db.rb'
require './app/classes/app.rb'

data = {}
data['parent_id'] = 0
data['catalog']   = 'test'
data['url']       = 'url'
Db.new.add('sf_catalog', data)

sql = "select * from sf_catalog"
Db.new.query(sql).each_hash do |item|
  # puts item
end
