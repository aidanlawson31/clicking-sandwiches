class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy, :show, :sort_category_menu_items, :save_sort_category_menu_items]
  before_action :set_menu
  
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category                         = Category.new(category_params)
    @category.menu_id                 = category_params[:menu_id]
    @category.display_sequence_number = next_display_sequence_number(@category.menu_id)

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

  def sort_category_menu_items
  end

  def save_sort_category_menu_items
    if @category.update(category_sort_params)
      redirect_to menu_path(@category.menu), notice: 'Menu Items successfully sorted.'
    else
      redirect_to menu_path(params[:menu_id])
    end
  end

  private

  def next_display_sequence_number(menu_id)
    menu          = Menu.find(menu_id)
    @categories   = menu.categories
    last_category = @categories.last
    last_category ? (last_category.display_sequence_number + 1) : 1
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def category_params
    params[:category].permit(:name, :menu_id, menu_items_attributes: [ :id, :display_sequence_number, :name, :description, :price, :item_options ])
  end

  def category_sort_params
    params[:category].permit(menu_items_attributes: [:id, :name, :code, :display_sequence_number ])
  end
end
