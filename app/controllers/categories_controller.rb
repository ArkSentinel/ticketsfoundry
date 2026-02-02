class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @category = Category.new
  end

  def edit
    @categories = Category.all # Lo necesitamos para mostrar la tabla al lado
    render :index
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Categoría creada."
    else
      @categories = Category.all
      render :index, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Categoría actualizada."
    else
      @categories = Category.all
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    if @category.tickets.none?
      @category.destroy
      redirect_to categories_path, notice: "Categoría eliminada."
    else
      redirect_to categories_path, alert: "No se puede eliminar una categoría en uso."
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end