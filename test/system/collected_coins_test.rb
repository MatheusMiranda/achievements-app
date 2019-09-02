require "application_system_test_case"

class CollectedCoinsTest < ApplicationSystemTestCase
  setup do
    @collected_coin = collected_coins(:one)
  end

  test "visiting the index" do
    visit collected_coins_url
    assert_selector "h1", text: "Collected Coins"
  end

  test "creating a Collected coin" do
    visit collected_coins_url
    click_on "New Collected Coin"

    fill_in "User", with: @collected_coin.user_id
    fill_in "Value", with: @collected_coin.value
    click_on "Create Collected coin"

    assert_text "Collected coin was successfully created"
    click_on "Back"
  end

  test "updating a Collected coin" do
    visit collected_coins_url
    click_on "Edit", match: :first

    fill_in "User", with: @collected_coin.user_id
    fill_in "Value", with: @collected_coin.value
    click_on "Update Collected coin"

    assert_text "Collected coin was successfully updated"
    click_on "Back"
  end

  test "destroying a Collected coin" do
    visit collected_coins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Collected coin was successfully destroyed"
  end
end
