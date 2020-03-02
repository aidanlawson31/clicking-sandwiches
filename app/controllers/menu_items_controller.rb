class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu_item, only: [:update, :destroy, :show]
  
  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item  = MenuItem.new(display_sequence_number: next_display_sequence_number)
    @categories = Category.find(params[:categories])
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @categories = Category.find(params[:categories])

    if @menu_item.save
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item created successfully"
    else
      render :new
    end
  end

  def edit
    @menu_item  = MenuItem.find(params[:menu_item])
    @categories = Category.find(params[:categories])
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item updated successfully"
    else
      render :show
    end
  end

  def destroy
    @menu = @menu_item.category.menu
    
    @menu_item.destroy
    redirect_to menu_path(@menu), notice: 'menu item was successfully destroyed.'
  end

  def show
  end

  private

  def next_display_sequence_number
    @menu_items = MenuItem.all
    last_menu_item = @menu_items.last
    last_menu_item ? (last_menu_item.display_sequence_number + 1) : 1
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def menu_item_params
    params[:menu_item].permit( 
      :name, :description, 
      :price, :code, :category_id, 
      :image, :display_sequence_number)
  end
end
