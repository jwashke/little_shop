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
    all_items.inject(0) do |sum, item|
      sum + item[:price]
    end
  end

  def all_items
    contents.map do |id, quantity|
      item = Item.find(id)
      { title: item.title,
        price: (item.price * quantity).round(2),
        quantity: quantity,
        image_path: item.image_path,
        description: item.description }
    end
  end
end
