require 'test_helper'

class AchievementCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @achievement_category = achievement_categories(:one)
  end

  test "should get index" do
    get achievement_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_achievement_category_url
    assert_response :success
  end

  test "should create achievement_category" do
    assert_difference('AchievementCategory.count') do
      post achievement_categories_url, params: { achievement_category: { level: @achievement_category.level, type: @achievement_category.type } }
    end

    assert_redirected_to achievement_category_url(AchievementCategory.last)
  end

  test "should show achievement_category" do
    get achievement_category_url(@achievement_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_achievement_category_url(@achievement_category)
    assert_response :success
  end

  test "should update achievement_category" do
    patch achievement_category_url(@achievement_category), params: { achievement_category: { level: @achievement_category.level, type: @achievement_category.type } }
    assert_redirected_to achievement_category_url(@achievement_category)
  end

  test "should destroy achievement_category" do
    assert_difference('AchievementCategory.count', -1) do
      delete achievement_category_url(@achievement_category)
    end

    assert_redirected_to achievement_categories_url
  end
end
