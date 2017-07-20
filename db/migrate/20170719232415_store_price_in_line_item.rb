class StorePriceInLineItem < ActiveRecord::Migration[5.0]
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    # LineItem.all.each do |line_item|
    #   line_item.update(price: line_item.product.price)
    # end

    LineItem.all.each do |line|
        line[:price] = line.product.price
        line.save
      end
  end

  def down
    remove_column :line_item, :price
  end
end
