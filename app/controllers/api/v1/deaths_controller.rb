class Api::V1::DeathsController < ApplicationController
  before_action :set_death, only: [:show, :edit, :update, :destroy]

  def index
    render json: Death.all.map{ |death| death.as_json }
  end

  def show
    render json: @death.as_json
  end

  def new
    @death = Death.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @death.update(death_params)
        render json: @death, status: 200
      else
        render json: @death.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @death.destroy
    render json: {status: 'SUCCESS', message:'Deleted Death', data: @death},status: :ok
  end

  private
    def set_death
      @death = Death.find(params[:id])
    end

    def death_params
      params.require(:death).permit(:user_id)
    end
end
