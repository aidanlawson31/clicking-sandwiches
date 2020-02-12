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

  def edit
  end

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      redirect_to location_path(@location), notice: "Location updated successfully"
    else
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
  end

  private

  def location_params
    params[:location].permit(:name, :address)
  end
end
