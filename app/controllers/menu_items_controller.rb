class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu
  before_action :set_menu_item, only: [:edit, :update, :destroy]

  def new
    @category  = Category.find(params[:category_id])
    @menu_item = @category.menu_items.new
  end

  def create
    @category  = Category.find(params[:category_id])
    @menu_item = @category.menu_items.new(menu_item_params)
    @menu_item.display_sequence_number = next_display_sequence_number

    if @menu_item.save
      redirect_to menu_path(@menu_item.category.menu), notice: 'Menu item created successfully.'
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
  end

  def update
    @menu_item.display_sequence_number = next_display_sequence_number
    
    if @menu_item.update(menu_item_params)
      redirect_to menu_path(@menu_item.category.menu), notice: 'Menu item updated successfully.'
    else
      render :edit
    end
  end

  def destroy    
    @menu_item.destroy
    redirect_to menu_path(@menu), notice: 'Menu item was successfully destroyed.'
  end

  private

  def next_display_sequence_number
    last_menu_item = @category.menu_items.last
    last_menu_item ? (last_menu_item.display_sequence_number + 1) : 1
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  end

  def set_category
    @category   = @menu_item.category
    @categories = @menu.categories
  end

  def set_menu
    @menu = Menu.find(params[:menu_id])
  end

  def menu_item_params
    params[:menu_item].permit( 
      :name, :description, :price, :code, :category_id, :image, :display_sequence_number,
      :item_options, menu_item_options_attributes: [:id, :name, :price, :display_sequence_number, :_destroy])
  end
end
