class FoodsController < ApplicationController
  include DateHelper
  skip_before_filter :verify_authenticity_token
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :set_me

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        @food.food_finder_team.delivered!
        flash[:success] = 'Food delivery was successfully reported.'
        format.html { redirect_to foods_url }
      else
        flash[:error] = 'Food delivery report failed.'
        format.html { redirect_to foods_url }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to @food, notice: 'Food was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      food = params.require(:food).permit(:content)
      food[:delivered_date] = self.last_friday
      food[:food_finder_team] = FoodFinderTeam.asc(:weight).first
      return food
    end
end
