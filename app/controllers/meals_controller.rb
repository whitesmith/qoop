class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @meals = Meal.all
  end

  def show
  end

  def address
    if true
      render json: { address: "0x..." }
    else
      render json: { error: "Abort" }
    end
  end

  def new
    @meal = Meal.new
  end

  def edit
    redirect_to meal_path(@meal) if @meal.owner != current_user
  end

  def create
    @meal = Meal.new(meal_params)
    @meal.owner = current_user

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def join
    @meal = Meal.find(params[:id])

    if @meal.owner.id == current_user.id
      redirect_to @meal
      return
    end

    if @meal.participants.include?(current_user)
      redirect_to @meal
      return
    end

    @meal.participants << current_user
    @meal.save
    redirect_to @meal
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:address, :title, :description,
                                   :max_people, :date, :place, :tags, :image).tap do |meal|
        meal[:tags] = meal[:tags].split(',').map(&:strip)
      end
    end
end
