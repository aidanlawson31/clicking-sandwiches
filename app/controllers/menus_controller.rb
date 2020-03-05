class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:update, :destroy, :show, :sort_menu_categories, :save_sort_menu_categories]
  
  def index
    @menus = Menu.all
    @menus = current_user.business.menus
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.business_id = current_user.business.id

    if @menu.save
      redirect_to menus_path, notice: "menu created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @menu.update(menu_params)
      redirect_to menu_path(@menu), notice: "menu updated successfully"
    else
      render :show
    end
  end

  def destroy
    
    @menu.destroy
    redirect_to menus_path, notice: 'menu was successfully destroyed.'
  end

  def show
    @categories = @menu.categories
    @locations  = current_user.business.locations
  end

  def sort_menu_categories
  end

  def save_sort_menu_categories
    puts "ALAL#{menu_sort_params}"
    puts @menu.inspect
    if @menu.update(menu_sort_params)
      redirect_to menu_path(@menu), notice: 'Categories successfully sorted.'
    else
      render :sort_menu_categories
    end
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params[:menu].permit(:name,	categories_attributes: [ :id, :name, :display_sequence_number ])
  end

  def menu_sort_params
    params[:menu].permit(categories_attributes: [:id, :name, :display_sequence_number ])
  end
end
