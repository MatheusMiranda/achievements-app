require "application_system_test_case"

class DeathsTest < ApplicationSystemTestCase
  setup do
    @death = deaths(:one)
  end

  test "visiting the index" do
    visit deaths_url
    assert_selector "h1", text: "Deaths"
  end

  test "creating a Death" do
    visit deaths_url
    click_on "New Death"

    fill_in "User", with: @death.user_id
    click_on "Create Death"

    assert_text "Death was successfully created"
    click_on "Back"
  end

  test "updating a Death" do
    visit deaths_url
    click_on "Edit", match: :first

    fill_in "User", with: @death.user_id
    click_on "Update Death"

    assert_text "Death was successfully updated"
    click_on "Back"
  end

  test "destroying a Death" do
    visit deaths_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Death was successfully destroyed"
  end
end
