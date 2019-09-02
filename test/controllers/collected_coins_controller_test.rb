require 'test_helper'

class CollectedCoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @collected_coin = collected_coins(:one)
  end

  test "should get index" do
    get collected_coins_url
    assert_response :success
  end

  test "should get new" do
    get new_collected_coin_url
    assert_response :success
  end

  test "should create collected_coin" do
    assert_difference('CollectedCoin.count') do
      post collected_coins_url, params: { collected_coin: { user_id: @collected_coin.user_id, value: @collected_coin.value } }
    end

    assert_redirected_to collected_coin_url(CollectedCoin.last)
  end

  test "should show collected_coin" do
    get collected_coin_url(@collected_coin)
    assert_response :success
  end

  test "should get edit" do
    get edit_collected_coin_url(@collected_coin)
    assert_response :success
  end

  test "should update collected_coin" do
    patch collected_coin_url(@collected_coin), params: { collected_coin: { user_id: @collected_coin.user_id, value: @collected_coin.value } }
    assert_redirected_to collected_coin_url(@collected_coin)
  end

  test "should destroy collected_coin" do
    assert_difference('CollectedCoin.count', -1) do
      delete collected_coin_url(@collected_coin)
    end

    assert_redirected_to collected_coins_url
  end
end
