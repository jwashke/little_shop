class Cart
  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    all_items.reduce(0) do |sum, item|
      sum + item[:price]
    end
  end

  def all_items
    contents.map do |k,v|
      item = Item.find(k)
      { title: item.title, price: (item.price * v).round(2), quantity: v, image_path: item.image_path, description: item.description }
    end
  end
end
