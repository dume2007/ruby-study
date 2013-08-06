exit if defined?(ENTRANCE).nil? || defined?(APP_NAME).nil?
# 加载常用类
require 'mysql'
require 'json'
require './app/classes/db.rb'

sql = "select * from category"
Db.new.query(sql).each_hash do |item|
  puts item
end
