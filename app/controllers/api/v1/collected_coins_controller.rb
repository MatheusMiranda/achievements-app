class Api::V1::CollectedCoinsController < ApplicationController
  before_action :set_collected_coin, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only[:create]

  def index
    render json: CollectedCoin.all.map{ |collected_coin| collected_coin.as_json }
  end

  def show
    render json: @collected_coin.as_json
  end

  def new
    @collected_coin = CollectedCoin.new
  end

  def edit
  end

  def create
    @collected_coin = CollectedCoin.new(collected_coin_params)

    respond_to do |format|
      if @collected_coin.save
        render json: {status: 'SUCCESS', message:'Saved Collected Coin', data: @collected_coin},status: :ok
      else
        render json: {status: 'ERROR', message:'Collected Coin not saved!', data: @collected_coin.errors},status: :unprocessable_entity
      end
    end
  end

  def update
    respond_to do |format|
      if @collected_coin.update(collected_coin_params)
        render json: @collected_coin, status: 200
      else
        render json: @collected_coin.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @collected_coin.destroy
    render json: {status: 'SUCCESS', message:'Deleted Collected Coin', data: @collected_coin},status: :ok
  end

  private
    def set_collected_coin
      @collected_coin = CollectedCoin.find(params[:id])
    end

    def collected_coin_params
      params.require(:collected_coin).permit(:value, :user_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
