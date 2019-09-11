class Api::V1::AchievementCategoriesController < ApplicationController
  before_action :set_achievement_category, only: [:show, :edit, :update, :destroy]

  # GET /achievement_categories
  # GET /achievement_categories.json
  def index
    @achievement_categories = AchievementCategory.all
    render json: AchievementCategory.all.map{ |achievement_category| achievement_category.as_json }
  end

  # GET /achievement_categories/1
  # GET /achievement_categories/1.json
  def show
    render json: @achievement_category.as_json
  end

  # GET /achievement_categories/new
  def new
    @achievement_category = AchievementCategory.new
  end

  # GET /achievement_categories/1/edit
  def edit
  end

  # POST /achievement_categories
  # POST /achievement_categories.json
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

  # PATCH/PUT /achievement_categories/1
  # PATCH/PUT /achievement_categories/1.json
  def update
    respond_to do |format|
      if @achievement_category.update(achievement_category_params)
        render json: @achievement_category, status: 200
      else
        render json: @achievement_category.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /achievement_categories/1
  # DELETE /achievement_categories/1.json
  def destroy
    @achievement_category.destroy
    render json: {status: 'SUCCESS', message:'Deleted Achievement Category', data: @achievement_category},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement_category
      @achievement_category = AchievementCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_category_params
      params.require(:achievement_category).permit(:type, :level)
    end
end
