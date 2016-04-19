# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

category = Category.create(name: "Haikus")
item_1 = Item.create(title: "item 1",
                     description: "This is the first item",
                     price: 9.99,
                     image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png",
                     category_id: category.id)
item_2 = Item.create(title: "item 2",
                     description: "This is the second item",
                     price: 5.99,
                     image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png")
