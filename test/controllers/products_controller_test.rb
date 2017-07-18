require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @update = {
      title:  'lorem Ipsum',
      description:  'Wibbles are fun!',
      image_url:  'lorem.jpg',
      price:  19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
# functional tests from Ch8 playtime
    assert_select '#columns #side a', minimum: 4
    assert_select '.list_description', 3
    assert_select 'h1', 'Products'
    assert_select '.products a', 'Show', minimum: 3
    assert_select '.products a', 'Edit', minimum: 3
    assert_select '.products a', 'Destroy', minimum: 3
# end functional tests
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: @update }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: @update }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
    end

    test "product is not valid without q unique title" do
      product = Product.new(title:        products(:ruby).title,
                            description:  "yyy",
                            price:        1,
                            image_url:    "fred.png")
      assert product.invalid?
      assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    end
end
