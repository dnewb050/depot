class LineItem < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :cart
  belongs_to :product, optional: true
  belongs_to :fulfillment, optional: true

  def total_price
    product.price * quantity
  end

end
