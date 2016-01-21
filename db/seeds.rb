# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

create_snacks = for i in 1..30 do 
	Snack.create!([name: "name no.#{i}", favorite_count: nil , 
		photo: "http://ec1img.pchome.com.tw/pic/v1/data/item/201402/D/B/A/E/5/7/DBAE57-A83542794000_52fb61632077c.jpg"])
end

create_orders = for i in 1..30 do 
	Order.create!([user_id: i%11+1, snack_id: i])
end