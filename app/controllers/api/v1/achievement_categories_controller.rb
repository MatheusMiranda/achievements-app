class Api::V1::AchievementCategoriesController < ApplicationController
  before_action :set_achievement_category, only: [:show, :edit, :update, :destroy]

  # GET /achievement_categories
  # GET /achievement_categories.json
  def index
    @achievement_categories = AchievementCategory.all
  end

  # GET /achievement_categories/1
  # GET /achievement_categories/1.json
  def show
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
        format.html { redirect_to @achievement_category, notice: 'Achievement category was successfully created.' }
        format.json { render :show, status: :created, location: @achievement_category }
      else
        format.html { render :new }
        format.json { render json: @achievement_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_categories/1
  # PATCH/PUT /achievement_categories/1.json
  def update
    respond_to do |format|
      if @achievement_category.update(achievement_category_params)
        format.html { redirect_to @achievement_category, notice: 'Achievement category was successfully updated.' }
        format.json { render :show, status: :ok, location: @achievement_category }
      else
        format.html { render :edit }
        format.json { render json: @achievement_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_categories/1
  # DELETE /achievement_categories/1.json
  def destroy
    @achievement_category.destroy
    respond_to do |format|
      format.html { redirect_to achievement_categories_url, notice: 'Achievement category was successfully destroyed.' }
      format.json { head :no_content }
    end
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
