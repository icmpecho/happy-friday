class FoodFinderTeamsController < ApplicationController
  before_action :set_food_finder_team, only: [:show, :edit, :update, :destroy]
  before_action :set_me
  before_action :set_title

  # GET /food_finder_teams
  # GET /food_finder_teams.json
  def index
      @food_finder_teams = FoodFinderTeam.asc(:weight)
  end

  # GET /food_finder_teams/1
  # GET /food_finder_teams/1.json
  def show
  end

  # GET /food_finder_teams/new
  def new
    @food_finder_team = FoodFinderTeam.new
    @food_finder_team.weight = FoodFinderTeam.desc(:weight).first.weight + 1
  end

  # GET /food_finder_teams/1/edit
  def edit
  end

  # POST /food_finder_teams
  # POST /food_finder_teams.json
  def create
    @food_finder_team = FoodFinderTeam.new(food_finder_team_params)

    respond_to do |format|
      if @food_finder_team.save
        format.html { redirect_to @food_finder_team, notice: 'Food finder team was successfully created.' }
        format.json { render action: 'show', status: :created, location: @food_finder_team }
      else
        format.html { render action: 'new' }
        format.json { render json: @food_finder_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /food_finder_teams/1
  # PATCH/PUT /food_finder_teams/1.json
  def update
    respond_to do |format|
      if @food_finder_team.update(food_finder_team_params)
        format.html { redirect_to @food_finder_team, notice: 'Food finder team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food_finder_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /food_finder_teams/1
  # DELETE /food_finder_teams/1.json
  def destroy
    @food_finder_team.destroy
    respond_to do |format|
      format.html { redirect_to food_finder_teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food_finder_team
      @food_finder_team = FoodFinderTeam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_finder_team_params
      params.require(:food_finder_team).permit(:name, :weight)
    end

    def set_me
      @me = session[:user_id] ? User.find(session[:user_id]) : nil
    end

    def set_title
      @title = 'Food Finder'
    end
end
