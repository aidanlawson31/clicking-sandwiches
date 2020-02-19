class LocationsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @locations = current_user.business.locations
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.business_id = current_user.business.id

    if @location.save
      redirect_to locations_path, notice: "Location created successfully"
    else
      render :new
    end
  end

  def add_menus
    @location = Location.find(params[:id])
    @added_menus = params[:added_menus]

    if @added_menus
      @added_menus.each do |menu|
        @location.location_menus.create(menu_id: menu)
      end
      flash.now[:notice] = "Menus successfully added to location."
    end
    redirect_to location_path(@location)
  end

  def show_menus
    @location = Location.find(params[:id])

    @menus = current_user.business.menus.select do |menu|
      LocationMenu.find_by(menu_id: menu.id, location_id: @location.id).present? ? false : true
    end
  end

  def remove_menu
    @location = Location.find(params[:id])
    @location_menu = LocationMenu.find(params[:location_menu])

    if @location.location_menus.delete(@location_menu)
      redirect_to location_path(@location)
      flash.now[:notice] = "Menu successfully removed from #{@location.name}"
    end
  end

  def edit
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to location_path(@location), notice: "Location updated"
      render :show
    end
  end

  def destroy
    @location = Location.find(params[:id])
    
    @location.destroy
    redirect_to locations_path, notice: 'Location was successfully destroyed.'
  end

  def show
    @location = Location.find(params[:id])
    @location_menus = @location.location_menus
    @menus = current_user.business.menus
  end

  private

  def location_params
    params[:location].permit(:name, :address, :location_menu, added_menus:[])
  end
end
