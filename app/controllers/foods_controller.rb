class FoodsController < ApplicationController
  before_action :set_food, only: %i[ show edit update destroy ]

  def index
    @foods = Food.order(id: :asc)
  end

  def show
  end

  def new
    @food = Food.new(new_food_params)
  end

  def edit
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to food_path(@food), notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @food.update(food_params)
      redirect_to food_path(@food), notice: 'Food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!

    redirect_to foods_path, notice: 'Food was successfully destroyed.'
  end

  private

    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(
        :title,
        :category,
        :subcategory,
        :subcategory_other_title,
        :cooking_method,
        :sparkling
      )
    end

    def new_food_params
      params.fetch(:food, {}).permit(:category, :subcategory)
    end
end
