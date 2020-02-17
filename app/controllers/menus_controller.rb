class MenusController < ApplicationController
  before_action :authenticate_user!
  
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
      # if @location.present?
      #   @menu.location_menus.create(location_id: @location)
      #   redirect_to location_path(@location), notice: "menu updated successfully"
      # end
      redirect_to menus_path, notice: "menu created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @menu = Menu.find(params[:id])

    if @menu.update(menu_params)
      redirect_to menu_path(@menu), notice: "menu updated successfully"
    else
      render :show
    end
  end

  def destroy
    @menu = Menu.find(params[:id])
    
    @menu.destroy
    redirect_to menus_path, notice: 'menu was successfully destroyed.'
  end

  def show
    @menu = Menu.find(params[:id])
    @categories = @menu.categories
    @locations = current_user.business.locations
  end

  private

  def menu_params
    params[:menu].permit(:name)
  end
end
