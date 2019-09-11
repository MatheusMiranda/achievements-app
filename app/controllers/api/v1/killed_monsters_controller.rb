class Api::V1::KilledMonstersController < ApplicationController
  before_action :set_killed_monster, only: [:show, :edit, :update, :destroy]

  def index
    render json: KilledMonster.all.map{ |killed_monsters| killed_monster.as_json }
  end

  def show
    render json: @killed_monster.as_json
  end

  def new
    @killed_monster = KilledMonster.new
  end

  def edit
  end

  def create
    @killed_monster = KilledMonster.new(killed_monster_params)

    respond_to do |format|
      if @killed_monster.save
        render json: {status: 'SUCCESS', message:'Saved Killed Monster', data: @killed_monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Killed Monster not saved!', data: @killed_monster.errors},status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @killed_monster.update(killed_monster_params)
        render json: @killed_monster, status: 200
      else
        render json: @killed_monster.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @killed_monster.destroy
    render json: {status: 'SUCCESS', message:'Deleted Killed Monster', data: @killed_monster},status: :ok
  end

  private
    def set_killed_monster
      @killed_monster = KilledMonster.find(params[:id])
    end

    def killed_monster_params
      params.require(:killed_monster).permit(:user_id, :monster_id)
    end
end
