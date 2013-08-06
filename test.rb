require 'open-uri'
# require 'iconv'
require 'mysql'
require 'json'
require File.expand_path('db')

# data = open('http://www.kuqin.com/rubycndocument/man/built-in-class/index.html') do |f|
#  f.read
#end

#data = Iconv.iconv('UTF-8', 'GB2312', data)
#puts data
#exit

p ENV
exit

@results = '{"content":{"name":"Sports Car","description":"Faux Cell Shaded Car. Animated.  3D Studio Max 2009 + Vray.","owner":{"system":"turbosquid","system_user_id":"MotionTech"},"tags":"car auto modelista gaming racing","products":{"compatible":["turbosquid"]},"i18n":{"available":["-"]},"extensions":{"turbosquid":{"id":544815,"availability":{"downloadable":false,"premium":null,"gallery":false},"rating_count":0,"rating_average":0.0,"online_3d_viewer":null,"feature_graph":["Object/vehicle/automobile/coupe/sports car"],"polygons":53560,"vertices":42613,"textures":true,"materials":true,"rigged":false,"animated":true,"uv_mapped":true,"squid_level":{"level":5,"name":"Emerald"}}},"categories":[{"taxonomy_id":"turbosquid_legacy","key":"20031","name":"Car","path":"3D Models>Vehicle>Car"},{"taxonomy_id":"turbosquid_legacy","key":"20176","name":"Concept","path":"3D Models>Vehicle>Car>Concept"}],"price":{"value":2000,"currency":"USD","denominator":100},"media":{"endpoints":{"previews":["http://preview.turbosquid.com"],"main":[]},"previews":[{"type":"image","id":3912295,"resolutions":{"res600x600":{"name":"/Preview/Content_2010_07_12__05_38_48/Car_01.jpg8e1b71e2-5a3a-486e-ac8f-5875c1477068Larger.jpg","resolution":{"w":600,"h":600}},"res128x128":{"name":"/Preview/Content_2010_07_12__05_38_48/Car_01.jpg8e1b71e2-5a3a-486e-ac8f-5875c1477068Mediumer.jpg","resolution":{"w":128,"h":128}},"res64x64":{"name":"/Preview/Content_2010_07_12__05_38_48/Car_01.jpg8e1b71e2-5a3a-486e-ac8f-5875c1477068Small.jpg","resolution":{"w":64,"h":64}}}},{"type":"image","id":3912296,"resolutions":{"res600x600":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_02.jpg8ae6327a-bc8d-4569-8cd4-9baa81dff72fLarger.jpg","resolution":{"w":600,"h":600}},"res128x128":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_02.jpg8ae6327a-bc8d-4569-8cd4-9baa81dff72fMediumer.jpg","resolution":{"w":128,"h":128}},"res64x64":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_02.jpg8ae6327a-bc8d-4569-8cd4-9baa81dff72fSmall.jpg","resolution":{"w":64,"h":64}}}},{"type":"image","id":3912297,"resolutions":{"res600x600":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_03.jpga9565f28-ae4f-4a1f-a64c-67b5d9978634Larger.jpg","resolution":{"w":600,"h":600}},"res128x128":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_03.jpga9565f28-ae4f-4a1f-a64c-67b5d9978634Mediumer.jpg","resolution":{"w":128,"h":128}},"res64x64":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_03.jpga9565f28-ae4f-4a1f-a64c-67b5d9978634Small.jpg","resolution":{"w":64,"h":64}}}},{"type":"image","id":3912294,"resolutions":{"res600x600":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_04.jpg4680a940-5295-4097-9930-c5d0d843ac6bLarger.jpg","resolution":{"w":600,"h":600}},"res128x128":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_04.jpg4680a940-5295-4097-9930-c5d0d843ac6bMediumer.jpg","resolution":{"w":128,"h":128}},"res64x64":{"name":"/Preview/Content_2010_12_09__13_39_34/Car_04.jpg4680a940-5295-4097-9930-c5d0d843ac6bSmall.jpg","resolution":{"w":64,"h":64}}}}],"main":[{"restricted":true,"id":3912289,"filesize":792425,"created_at":null,"fileformat":{"name":"3ds Max ( .max )"}}],"compatible_applications":["3ds Max","AutoCAD"]},"id":"502992903346328770","created_at":"2013-07-18T21:04:25Z","updated_at":"2013-07-18T21:04:25Z","generation":0}}'
@results = JSON.parse(@results)
puts @results.class

puts @results['content']['name']
exit

obj = Db.new
# add
data = {name: 'user1', addtime: Time.now.to_i}
obj.add('test', data)

# query
sql = 'select * from test'
obj.query(sql).each_hash do |f|
  puts f['name']
  puts f['addtime']
end

# find
rs = obj.find('test', 'id > 0')
if rs.nil?
  puts '0 result find'
else
  puts rs
end



