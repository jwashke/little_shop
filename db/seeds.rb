Category.create(name: "fiction")
Category.create(name: "literature")
Category.create(name: "history")
Category.create(name: "non-fiction")

category_1 = Category.all[0]
category_2 = Category.all[1]
category_3 = Category.all[2]
category_4 = Category.all[3]


5.times do |i|
  category_2.items.create(
    title: "Item #{i}",
    description: "Description #{i}",
    price: 5.99,
    image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png"
  )
end

5.times do |i|
  category_1.items.create(
    title: "Item #{i + 5}",
    description: "Description #{i + 5}",
    price: 5.99,
    image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png"
  )
end

5.times do |i|
  category_3.items.create(
    title: "Item #{i + 10}",
    description: "Description #{i + 10}",
    price: 5.99,
    image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png"
  )
end

5.times do |i|
  category_4.items.create(
    title: "Item #{i + 15}",
    description: "Description #{i + 15}",
    price: 5.99,
    image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png"
  )
end

User.create(
  email: "user@example.com",
  password: "password",
  first_name: "first name",
  last_name: "last name",
  address: "address",
  city: "city",
  state: "state",
  zip: "zip"
)

User.create(
  email: "admin@example.com",
  password: "password",
  first_name: "first name",
  last_name: "last name",
  address: "address",
  city: "city",
  state: "state",
  zip: "zip",
  role: 1
)

category_4.items.create(
  title: "Item #{44}",
  description: "Description #{44}",
  price: 5.99,
  image_path: "http://www.hikashop.com/media/com_hikashop/upload/pdf.png",
  state: 1
)
