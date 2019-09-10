class Api::V1::CollectedCoinsController < ApplicationController
  before_action :set_collected_coin, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only[:create]

  # GET /collected_coins
  # GET /collected_coins.json
  def index
    @collected_coins = CollectedCoin.all
  end

  # GET /collected_coins/1
  # GET /collected_coins/1.json
  def show
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
        format.html { redirect_to @collected_coin, notice: 'Collected coin was successfully created.' }
        format.json { render :show, status: :created, location: @collected_coin }
      else
        format.html { render :new }
        format.json { render json: @collected_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collected_coins/1
  # PATCH/PUT /collected_coins/1.json
  def update
    respond_to do |format|
      if @collected_coin.update(collected_coin_params)
        format.html { redirect_to @collected_coin, notice: 'Collected coin was successfully updated.' }
        format.json { render :show, status: :ok, location: @collected_coin }
      else
        format.html { render :edit }
        format.json { render json: @collected_coin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collected_coins/1
  # DELETE /collected_coins/1.json
  def destroy
    @collected_coin.destroy
    respond_to do |format|
      format.html { redirect_to collected_coins_url, notice: 'Collected coin was successfully destroyed.' }
      format.json { head :no_content }
    end
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
