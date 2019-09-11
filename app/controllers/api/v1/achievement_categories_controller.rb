class Api::V1::AchievementCategoriesController < ApplicationController
  before_action :set_achievement_category, only: [:show, :edit, :update, :destroy]

  def index
    @achievement_categories = AchievementCategory.all
    render json: AchievementCategory.all.map{ |achievement_category| achievement_category.as_json }
  end

  def show
    render json: @achievement_category.as_json
  end

  def new
    @achievement_category = AchievementCategory.new
  end

  def edit
  end

  def create
    @achievement_category = AchievementCategory.new(achievement_category_params)

    respond_to do |format|
      if @achievement_category.save
        render json: {status: 'SUCCESS', message:'Saved Achievement Category', data: @achievement_category},status: :ok
      else
        render json: {status: 'ERROR', message:'Achievement Category not saved!', data: @achievement_category.errors},status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @achievement_category.update(achievement_category_params)
        render json: @achievement_category, status: 200
      else
        render json: @achievement_category.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @achievement_category.destroy
    render json: {status: 'SUCCESS', message:'Deleted Achievement Category', data: @achievement_category},status: :ok
  end

  private
    def set_achievement_category
      @achievement_category = AchievementCategory.find(params[:id])
    end

    def achievement_category_params
      params.require(:achievement_category).permit(:type, :level)
    end
end
