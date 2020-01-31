class CategoriesController < ApplicationController
  before_action :authenticate_user!
  
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
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to menu_path(@category.menu), notice: "Category updated successfully"
    else
      render :show
    end
  end

  def destroy
    @category = Category.find(params[:id])
    
    @category.destroy
    redirect_to menu_path(@category.menu), notice: 'Category was successfully destroyed.'
  end

  def show
    @category = Category.find(params[:id])
  end

  private

  def category_params
    params[:category].permit(:name, :menu_id)
  end
end
