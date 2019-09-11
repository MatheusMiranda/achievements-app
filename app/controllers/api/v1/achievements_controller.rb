class Api::V1::AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  def index
    render json: Achievement.map{ |achievement| achievement.as_json }
  end

  def show
    render json: @achievement.as_json
  end

  def new
    @achievement = Achievement.new
  end

  def edit
  end

  def create
    @achievement = Achievement.new(achievement_params)

    respond_to do |format|
      if @achievement.save
        render json: {status: 'SUCCESS', message:'Saved Achievement', data: @achievement},status: :ok
      else
        render json: {status: 'ERROR', message:'Achievement not saved!', data: @achievement.errors},status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        render json: @achievement, status: 200
      else
        render json: @achievement.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @achievement.destroy
    render json: {status: 'SUCCESS', message:'Deleted Achievement', data: @achievement},status: :ok
  end

  private
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    def achievement_params
      params.require(:achievement).permit(:user_id)
    end
end
