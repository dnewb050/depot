require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'cart should create a new line item when adding a unique product' do
    cart = Cart.create
    cart.add_product(products(:ruby)).save
    assert_equal 1, cart.line_items.length
    cart.add_product(products(:one)).save
    assert_equal 2, cart.line_items.length
  end

  test 'cart should fail to create a new line item when adding a duplicate product' do
    cart = Cart.create
    cart.add_product(products(:ruby)).save
    assert_equal 1, cart.line_items.length
    cart.add_product(products(:ruby)).save
    assert_equal 1, cart.line_items.length
  end

end
