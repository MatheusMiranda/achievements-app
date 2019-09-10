class Api::V1::DeathsController < ApplicationController
  before_action :set_death, only: [:show, :edit, :update, :destroy]

  # GET /deaths
  # GET /deaths.json
  def index
    @deaths = Death.all
  end

  # GET /deaths/1
  # GET /deaths/1.json
  def show
  end

  # GET /deaths/new
  def new
    @death = Death.new
  end

  # GET /deaths/1/edit
  def edit
  end

  # POST /deaths
  # POST /deaths.json
  def create
    @death = Death.new(death_params)
    @user.update_achievements("deaths")

    respond_to do |format|
      if @death.save
        format.html { redirect_to @death, notice: 'Death was successfully created.' }
        format.json { render :show, status: :created, location: @death }
      else
        format.html { render :new }
        format.json { render json: @death.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deaths/1
  # PATCH/PUT /deaths/1.json
  def update
    respond_to do |format|
      if @death.update(death_params)
        format.html { redirect_to @death, notice: 'Death was successfully updated.' }
        format.json { render :show, status: :ok, location: @death }
      else
        format.html { render :edit }
        format.json { render json: @death.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deaths/1
  # DELETE /deaths/1.json
  def destroy
    @death.destroy
    respond_to do |format|
      format.html { redirect_to deaths_url, notice: 'Death was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_death
      @death = Death.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def death_params
      params.require(:death).permit(:user_id)
    end
end
