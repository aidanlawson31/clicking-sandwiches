class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy, :show]
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
    @menus = Menu.all
  end

  def create
    @category = Category.new(category_params)
 
    if @category.save
      redirect_to menu_path(@category.menu), notice: "Category created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to menu_path(@category.menu), notice: "Category updated successfully"
    else
      render :show
    end
  end

  def destroy    
    @category.destroy
    redirect_to menu_path(@category.menu), notice: 'Category was successfully destroyed.'
  end

  def show
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params[:category].permit(:name, :menu_id, menu_items_attributes: [ :id, :display_sequence, :name, :description, :price ])
  end
end
