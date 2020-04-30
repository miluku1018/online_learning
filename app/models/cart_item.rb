class CartItem
  attr_reader :product_id, :quantity

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

  def product
    Course.find_by(id: product_id)
  end

  def total_price
    @quantity * product.price.to_i
  end
end