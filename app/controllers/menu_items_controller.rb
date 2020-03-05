class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu_item, only: [:edit, :update, :destroy, :show]
  before_action :set_menu
  
  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
    @category  = Category.find(params[:category_id])
  end

  def create
    @menu_item                         = MenuItem.new(menu_item_params)
    @menu_item.category_id             = params[:category_id]
    @menu_item.display_sequence_number = next_display_sequence_number(@menu_item.category_id)

    if @menu_item.save
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item created successfully"
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item updated successfully"
    else
      render :new
    end
  end

  def destroy    
    @menu_item.destroy
    redirect_to menu_path(@menu), notice: 'menu item was successfully destroyed.'
  end

  def show
  end

  private

  def next_display_sequence_number(category_id)
    category       = Category.find(category_id)
    @menu_items    = category.menu_items
    last_menu_item = @menu_items.last
    last_menu_item ? (last_menu_item.display_sequence_number + 1) : 1
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
    @category  = @menu_item.category
  end

  def set_menu
    @menu       = Menu.find(params[:menu_id])
    @categories = @menu.categories
  end

  def menu_item_params
    params[:menu_item].permit( 
      :name, :description, 
      :price, :code, :category_id, 
      :image, :display_sequence_number)
  end
end
