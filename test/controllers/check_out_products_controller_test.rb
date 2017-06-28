require 'test_helper'

class CheckOutProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_out_product = check_out_products(:one)
  end

  test "should get index" do
    get check_out_products_url
    assert_response :success
  end

  test "should get new" do
    get new_check_out_product_url
    assert_response :success
  end

  test "should create check_out_product" do
    assert_difference('CheckOutProduct.count') do
      post check_out_products_url, params: { check_out_product: { check_out_id: @check_out_product.check_out_id, date_added: @check_out_product.date_added, product_id: @check_out_product.product_id } }
    end

    assert_redirected_to check_out_product_url(CheckOutProduct.last)
  end

  test "should show check_out_product" do
    get check_out_product_url(@check_out_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_check_out_product_url(@check_out_product)
    assert_response :success
  end

  test "should update check_out_product" do
    patch check_out_product_url(@check_out_product), params: { check_out_product: { check_out_id: @check_out_product.check_out_id, date_added: @check_out_product.date_added, product_id: @check_out_product.product_id } }
    assert_redirected_to check_out_product_url(@check_out_product)
  end

  test "should destroy check_out_product" do
    assert_difference('CheckOutProduct.count', -1) do
      delete check_out_product_url(@check_out_product)
    end

    assert_redirected_to check_out_products_url
  end
end
