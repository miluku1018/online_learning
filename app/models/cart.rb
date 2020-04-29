class Cart
  attr_reader :items
  def initialize(items = [])
   @items = items
  end

  def add_item(product_id)
   found_item = @items.find{|item| item.product_id == product_id}

    if found_item
    else
      @items << CartItem.new(product_id)
    end
  end

  def empty?
   @items.empty?
  end

  def total_price
    @items.reduce(0) {|sum, item| sum + item.total_price}
  end

  def serialize
    result = @items.map { |item|
      {"product_id" => item.product_id, "quantity" => item.quantity}
    }
    {"items" => result}
  end

  def self.from_hash(hash = nil)
    if hash && hash["items"]
      #還原
      items = []
      hash["items"].each do |item|
      items << CartItem.new(item["product_id"], item["quantity"])
      end
      Cart.new(items)
    else
      #新車
      Cart.new([])
     end
  end
end