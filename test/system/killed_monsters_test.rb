require "application_system_test_case"

class KilledMonstersTest < ApplicationSystemTestCase
  setup do
    @killed_monster = killed_monsters(:one)
  end

  test "visiting the index" do
    visit killed_monsters_url
    assert_selector "h1", text: "Killed Monsters"
  end

  test "creating a Killed monster" do
    visit killed_monsters_url
    click_on "New Killed Monster"

    fill_in "Monster", with: @killed_monster.monster_id
    fill_in "User", with: @killed_monster.user_id
    click_on "Create Killed monster"

    assert_text "Killed monster was successfully created"
    click_on "Back"
  end

  test "updating a Killed monster" do
    visit killed_monsters_url
    click_on "Edit", match: :first

    fill_in "Monster", with: @killed_monster.monster_id
    fill_in "User", with: @killed_monster.user_id
    click_on "Update Killed monster"

    assert_text "Killed monster was successfully updated"
    click_on "Back"
  end

  test "destroying a Killed monster" do
    visit killed_monsters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Killed monster was successfully destroyed"
  end
end
