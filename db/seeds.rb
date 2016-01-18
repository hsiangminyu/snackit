# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

create_snacks = for i in 1..20 do 
	Srsnack.create!([name: "name no.#{i}", follow_count: i%5 , 
		photo: "http://ec1img.pchome.com.tw/pic/v1/data/item/201402/D/B/A/E/5/7/DBAE57-A83542794000_52fb61632077c.jpg",
		pchome_url: "http://24h.pchome.com.tw/prod/DBAE57-A83542794"])
end