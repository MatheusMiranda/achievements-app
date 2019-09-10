class Api::V1::KilledMonstersController < ApplicationController
  before_action :set_killed_monster, only: [:show, :edit, :update, :destroy]

  # GET /killed_monsters
  # GET /killed_monsters.json
  def index
    @killed_monsters = KilledMonster.all
  end

  # GET /killed_monsters/1
  # GET /killed_monsters/1.json
  def show
  end

  # GET /killed_monsters/new
  def new
    @killed_monster = KilledMonster.new
  end

  # GET /killed_monsters/1/edit
  def edit
  end

  # POST /killed_monsters
  # POST /killed_monsters.json
  def create
    @killed_monster = KilledMonster.new(killed_monster_params)

    respond_to do |format|
      if @killed_monster.save
        format.html { redirect_to @killed_monster, notice: 'Killed monster was successfully created.' }
        format.json { render :show, status: :created, location: @killed_monster }
      else
        format.html { render :new }
        format.json { render json: @killed_monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /killed_monsters/1
  # PATCH/PUT /killed_monsters/1.json
  def update
    respond_to do |format|
      if @killed_monster.update(killed_monster_params)
        format.html { redirect_to @killed_monster, notice: 'Killed monster was successfully updated.' }
        format.json { render :show, status: :ok, location: @killed_monster }
      else
        format.html { render :edit }
        format.json { render json: @killed_monster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /killed_monsters/1
  # DELETE /killed_monsters/1.json
  def destroy
    @killed_monster.destroy
    respond_to do |format|
      format.html { redirect_to killed_monsters_url, notice: 'Killed monster was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_killed_monster
      @killed_monster = KilledMonster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def killed_monster_params
      params.require(:killed_monster).permit(:user_id, :monster_id)
    end
end
