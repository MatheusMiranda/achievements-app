require "application_system_test_case"

class AchievementCategoriesTest < ApplicationSystemTestCase
  setup do
    @achievement_category = achievement_categories(:one)
  end

  test "visiting the index" do
    visit achievement_categories_url
    assert_selector "h1", text: "Achievement Categories"
  end

  test "creating a Achievement category" do
    visit achievement_categories_url
    click_on "New Achievement Category"

    fill_in "Level", with: @achievement_category.level
    fill_in "Type", with: @achievement_category.type
    click_on "Create Achievement category"

    assert_text "Achievement category was successfully created"
    click_on "Back"
  end

  test "updating a Achievement category" do
    visit achievement_categories_url
    click_on "Edit", match: :first

    fill_in "Level", with: @achievement_category.level
    fill_in "Type", with: @achievement_category.type
    click_on "Update Achievement category"

    assert_text "Achievement category was successfully updated"
    click_on "Back"
  end

  test "destroying a Achievement category" do
    visit achievement_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Achievement category was successfully destroyed"
  end
end
