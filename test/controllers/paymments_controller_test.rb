require 'test_helper'

class PaymmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @paymment = paymments(:one)
  end

  test "should get index" do
    get paymments_url
    assert_response :success
  end

  test "should get new" do
    get new_paymment_url
    assert_response :success
  end

  test "should create paymment" do
    assert_difference('Paymment.count') do
      post paymments_url, params: { paymment: { ammount: @paymment.ammount, cost: @paymment.cost, detail: @paymment.detail, detail_paymment: @paymment.detail_paymment, detail_products: @paymment.detail_products, shipping: @paymment.shipping, state_payed: @paymment.state_payed, state_shipped: @paymment.state_shipped, state_take: @paymment.state_take, user_id: @paymment.user_id } }
    end

    assert_redirected_to paymment_url(Paymment.last)
  end

  test "should show paymment" do
    get paymment_url(@paymment)
    assert_response :success
  end

  test "should get edit" do
    get edit_paymment_url(@paymment)
    assert_response :success
  end

  test "should update paymment" do
    patch paymment_url(@paymment), params: { paymment: { ammount: @paymment.ammount, cost: @paymment.cost, detail: @paymment.detail, detail_paymment: @paymment.detail_paymment, detail_products: @paymment.detail_products, shipping: @paymment.shipping, state_payed: @paymment.state_payed, state_shipped: @paymment.state_shipped, state_take: @paymment.state_take, user_id: @paymment.user_id } }
    assert_redirected_to paymment_url(@paymment)
  end

  test "should destroy paymment" do
    assert_difference('Paymment.count', -1) do
      delete paymment_url(@paymment)
    end

    assert_redirected_to paymments_url
  end
end
