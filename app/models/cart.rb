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
      sum + item.price
    end.round(2)
  end

  def all_items
    contents.map do |id, quantity|
      item = Item.find(id)
      CartItems.new(item, quantity)
    end
  end

  def delete_item(item_id)
    contents.delete(item_id.to_s)
  end

  def update_item(item_id, quantity)
    contents[item_id.to_s] = quantity
  end
end
