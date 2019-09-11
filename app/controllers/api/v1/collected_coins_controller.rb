class Api::V1::CollectedCoinsController < ApplicationController
  before_action :set_collected_coin, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only[:create]

  # GET /collected_coins
  # GET /collected_coins.json
  def index
    render json: CollectedCoin.all.map{ |collected_coin| collected_coin.as_json }
  end

  # GET /collected_coins/1
  # GET /collected_coins/1.json
  def show
    render json: @collected_coin.as_json
  end

  # GET /collected_coins/new
  def new
    @collected_coin = CollectedCoin.new
  end

  # GET /collected_coins/1/edit
  def edit
  end

  # POST /collected_coins
  # POST /collected_coins.json
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

  # PATCH/PUT /collected_coins/1
  # PATCH/PUT /collected_coins/1.json
  def update
    respond_to do |format|
      if @collected_coin.update(collected_coin_params)
        render json: @collected_coin, status: 200
      else
        render json: @collected_coin.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /collected_coins/1
  # DELETE /collected_coins/1.json
  def destroy
    @collected_coin.destroy
    render json: {status: 'SUCCESS', message:'Deleted Collected Coin', data: @collected_coin},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collected_coin
      @collected_coin = CollectedCoin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collected_coin_params
      params.require(:collected_coin).permit(:value, :user_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
