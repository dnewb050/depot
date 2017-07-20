class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
    @count = increment_index_count
  end

  def increment_index_count
    session[:counter].nil? ? session[:counter] = 1 : session[:counter] += 1
  end
end
