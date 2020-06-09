class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: [:edit, :update, :destroy, :show, :sort_category_menu_items, :save_sort_category_menu_items]
  before_action :set_menu
  
  def index
    @categories = Category.all
  end

  def new
    @category = @menu.categories.new
    render file: "categories/new.js.erb"
  end

  def create
    @category = @menu.categories.new(category_params)
    @category.display_sequence_number = next_display_sequence_number
 
    if @category.save
      render file: "categories/create.js.erb"
    else
      render file: "categories/new.js.erb"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      render file: "categories/update.js.erb"
    else
      render file: "categories/edit.js.erb"
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
      render :sort_category_menu_items
    end
  end

  private

  def next_display_sequence_number
    last_category = @menu.categories.last
    last_category ? (last_category.display_sequence_number + 1) : 1
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def category_params
    params[:category].permit(:name, :menu_id, :display_sequence_number, menu_items_attributes: [ :id, :display_sequence_number, :name, :description, :price, :item_options ])
  end

  def category_sort_params
    params[:category].permit(menu_items_attributes: [:id, :name, :code, :display_sequence_number ])
  end
end
