class MenuItemsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @menu_items = MenuItem.all
  end

  def new
    @menu_item  = MenuItem.new
    @categories = Category.find(params[:categories])
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)

    if @menu_item.save
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item created successfully"
    else
      render :new
    end
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def update
    @menu_item = MenuItem.find(params[:id])

    if @menu_item.update(menu_item_params)
      redirect_to menu_path(@menu_item.category.menu), notice: "menu item updated successfully"
    else
      render :show
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu      = @menu_item.category.menu
    
    @menu_item.destroy
    redirect_to menu_path(@menu), notice: 'menu item was successfully destroyed.'
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  private

  def menu_item_params
    params[:menu_item].permit(:name, :description, :price, :code, :category_id)
  end
end
