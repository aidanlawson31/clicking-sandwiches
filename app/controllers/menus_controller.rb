class MenusController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu, only: [:update, :destroy, :show, :sort_menu_categories, :save_sort_menu_categories]
  before_action :form_setup, only: [:update, :show]
  
  def index
    @menus = current_business.menus
  end

  def new
    @menu = current_business.menus.new
  end

  def create
    @menu = current_business.menus.new(menu_params)

    if @menu.save
      redirect_to menu_path(@menu), notice: "menu created successfully"
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
  end

  def sort_menu_categories
  end

  def save_sort_menu_categories
    if @menu.update(menu_sort_params)
      redirect_to menu_path(@menu), notice: 'Categories successfully sorted.'
    else
      render :sort_menu_categories
    end
  end

  private

  def form_setup
    @categories = @menu.categories
    @locations  = current_business.locations
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params[:menu].permit(:display_name, :internal_name, :image, :remove_menu_banner,
      :description, :menu_url, categories_attributes: [ :id, :name, :display_sequence_number ])
  end

  def menu_sort_params
    params[:menu].permit(categories_attributes: [:id, :name, :display_sequence_number ])
  end
end
