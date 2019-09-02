require 'test_helper'

class DeathsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @death = deaths(:one)
  end

  test "should get index" do
    get deaths_url
    assert_response :success
  end

  test "should get new" do
    get new_death_url
    assert_response :success
  end

  test "should create death" do
    assert_difference('Death.count') do
      post deaths_url, params: { death: { user_id: @death.user_id } }
    end

    assert_redirected_to death_url(Death.last)
  end

  test "should show death" do
    get death_url(@death)
    assert_response :success
  end

  test "should get edit" do
    get edit_death_url(@death)
    assert_response :success
  end

  test "should update death" do
    patch death_url(@death), params: { death: { user_id: @death.user_id } }
    assert_redirected_to death_url(@death)
  end

  test "should destroy death" do
    assert_difference('Death.count', -1) do
      delete death_url(@death)
    end

    assert_redirected_to deaths_url
  end
end
