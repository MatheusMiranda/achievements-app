class Api::V1::MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  def index
    render json: Monster.all.map{ |monster| monster.as_json }
  end

  def show
    render json: @monster.as_json
  end

  def new
    @monster = Monster.new
  end

  def edit
  end

  def create
    @monster = Monster.new(monster_params)

    respond_to do |format|
      if @monster.save
        render json: {status: 'SUCCESS', message:'Saved Monster', data: @monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not saved!', data: @monster.errors},status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @monster.save
        render json: {status: 'SUCCESS', message:'Saved Monster', data: @monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not saved!', data: @monster.errors},status: :unprocessable_entity
      end
    end
  end

  def destroy
    @monster.destroy
    render json: {status: 'SUCCESS', message:'Deleted Monster', data: @monster},status: :ok
  end

  private
    def set_monster
      @monster = Monster.find(params[:id])
    end

    def monster_params
      params.require(:monster).permit(:name)
    end
end
