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
    puts "ALALAL #{params}" 

    @location = Location.find(params[:id])

    puts "ALALAL2 #{params}" 


    # puts "ALALAL #{location_params[:added_menus]}" 

    # @added_menus.each do |menu|
    #   menu.location_menu.create(location_id: @location)
    # end

    # puts "ALALAL #{location_params[:added_menus]}" 
  end

  def show_menus
    @location = Location.find(params[:id])
    @menus = current_user.business.menus
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
    @menus = current_user.business.menus
  end

  private

  def location_params
    params[:location].permit(:name, :address, added_menus:[])
  end
end
