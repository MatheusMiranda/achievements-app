class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    users = User.all

    users.each do |user|
      user.update_all_achievements
    end

    render json: users.map{ |user| user.as_json }
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user.as_json
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        render json: {status: 'SUCCESS', message:'Saved User', data: @user},status: :ok
      else
        render json: {status: 'ERROR', message:'User not saved!', data: @user.errors},status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        render json: @user, status: 200
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    render json: {status: 'SUCCESS', message:'Deleted User', data: @user},status: :ok
  end

  # GET /users/:id/get_achievements
  def get_achievements
    @user.achievements
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end
end
