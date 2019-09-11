class Api::V1::AchievementsController < ApplicationController
  before_action :set_achievement, only: [:show, :edit, :update, :destroy]

  # GET /achievements
  # GET /achievements.json
  def index
    render json: Achievement.map{ |achievement| achievement.as_json }
  end

  # GET /achievements/1
  # GET /achievements/1.json
  def show
    render json: @achievement.as_json
  end

  # GET /achievements/new
  def new
    @achievement = Achievement.new
  end

  # GET /achievements/1/edit
  def edit
  end

  # POST /achievements
  # POST /achievements.json
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

  # PATCH/PUT /achievements/1
  # PATCH/PUT /achievements/1.json
  def update
    respond_to do |format|
      if @achievement.update(achievement_params)
        render json: @achievement, status: 200
      else
        render json: @achievement.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.json
  def destroy
    @achievement.destroy
    render json: {status: 'SUCCESS', message:'Deleted Achievement', data: @achievement},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_params
      params.require(:achievement).permit(:user_id)
    end
end
