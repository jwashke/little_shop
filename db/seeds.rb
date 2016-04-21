category = Category.create(name: "Haikus")
category = Category.create(name: "Limericks")
5.times do |i|
  category_2.items.create(title: "Item #{i}",
                          description: "Description #{i}",
                          image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png")
end

5.times do |i|
  category_1.items.create(title: "Item #{i + 5}",
                          description: "Description #{i + 5}",
                          image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png")
end
