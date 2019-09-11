class Api::V1::DeathsController < ApplicationController
  before_action :set_death, only: [:show, :edit, :update, :destroy]

  # GET /deaths
  # GET /deaths.json
  def index
    render json: Death.all.map{ |death| death.as_json }
  end

  # GET /deaths/1
  # GET /deaths/1.json
  def show
    render json: @death.as_json
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

    respond_to do |format|
      if @death.save
        render json: {status: 'SUCCESS', message:'Saved Death', data: @death},status: :ok
      else
        render json: {status: 'ERROR', message:'Death not saved!', data: @death.errors},status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /deaths/1
  # PATCH/PUT /deaths/1.json
  def update
    respond_to do |format|
      if @death.update(death_params)
        render json: @death, status: 200
      else
        render json: @death.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /deaths/1
  # DELETE /deaths/1.json
  def destroy
    @death.destroy
    render json: {status: 'SUCCESS', message:'Deleted Death', data: @death},status: :ok
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
