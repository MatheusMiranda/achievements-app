require 'test_helper'

class KilledMonstersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @killed_monster = killed_monsters(:one)
  end

  test "should get index" do
    get killed_monsters_url
    assert_response :success
  end

  test "should get new" do
    get new_killed_monster_url
    assert_response :success
  end

  test "should create killed_monster" do
    assert_difference('KilledMonster.count') do
      post killed_monsters_url, params: { killed_monster: { monster_id: @killed_monster.monster_id, user_id: @killed_monster.user_id } }
    end

    assert_redirected_to killed_monster_url(KilledMonster.last)
  end

  test "should show killed_monster" do
    get killed_monster_url(@killed_monster)
    assert_response :success
  end

  test "should get edit" do
    get edit_killed_monster_url(@killed_monster)
    assert_response :success
  end

  test "should update killed_monster" do
    patch killed_monster_url(@killed_monster), params: { killed_monster: { monster_id: @killed_monster.monster_id, user_id: @killed_monster.user_id } }
    assert_redirected_to killed_monster_url(@killed_monster)
  end

  test "should destroy killed_monster" do
    assert_difference('KilledMonster.count', -1) do
      delete killed_monster_url(@killed_monster)
    end

    assert_redirected_to killed_monsters_url
  end
end
