class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    users = User.all

    users.each do |user|
      user.update_all_achievements
    end

    render json: users.map{ |user| user.as_json }
  end

  def show
    render json: @user.as_json
  end

  def new
    @user = User.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @user.update(user_params)
        render json: @user, status: 200
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @user.destroy
    render json: {status: 'SUCCESS', message:'Deleted User', data: @user},status: :ok
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name)
    end
end
