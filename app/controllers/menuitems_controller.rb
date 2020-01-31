class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item = MenuItem.new
  end

  def create
    @menu_item = MenuItem.new(menu_params)

    if @menu_item.save
      redirect_to menu_items_path, notice: "menu item created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update(menu_params)
      redirect_to menu_items_path(@menu_item), notice: "menu item updated successfully"
    else
      render :show
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    
    @menu_item.destroy
    redirect_to menu_items_path, notice: 'menu item was successfully destroyed.'
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  private

  def menu_item_params
    params[:menu].permit(:name)
  end
end
