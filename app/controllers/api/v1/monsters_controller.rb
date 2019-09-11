class Api::V1::MonstersController < ApplicationController
  before_action :set_monster, only: [:show, :edit, :update, :destroy]

  # GET /monsters
  # GET /monsters.json
  def index
    render json: Monster.all.map{ |monster| monster.as_json }
  end

  # GET /monsters/1
  # GET /monsters/1.json
  def show
    render json: @monster.as_json
  end

  # GET /monsters/new
  def new
    @monster = Monster.new
  end

  # GET /monsters/1/edit
  def edit
  end

  # POST /monsters
  # POST /monsters.json
  def create
    @monster = Monster.new(monster_params)

    respond_to do |format|
      if @monster.save
        render json: {status: 'SUCCESS', message:'Saved Monster', data: @monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not saved!', data: @monster.errors},status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /monsters/1
  # PATCH/PUT /monsters/1.json
  def update
    respond_to do |format|
      if @monster.save
        render json: {status: 'SUCCESS', message:'Saved Monster', data: @monster},status: :ok
      else
        render json: {status: 'ERROR', message:'Monster not saved!', data: @monster.errors},status: :unprocessable_entity
      end
    end
  end

  # DELETE /monsters/1
  # DELETE /monsters/1.json
  def destroy
    @monster.destroy
    render json: {status: 'SUCCESS', message:'Deleted Monster', data: @monster},status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster
      @monster = Monster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_params
      params.require(:monster).permit(:name)
    end
end
