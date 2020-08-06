class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_location, only: [:add_menu, :show_menus, :remove_menu, :add_image, :save_sort_image, :update, :destroy, :show]
  
  def index
    @locations = current_user.business.locations
  end

  def new
    @location = Location.new
  end

  def create
    @location = current_business.locations.new(location_params)

    if @location.save
      redirect_to business_locations_path(current_business), notice: "Location created successfully"
    else
      render :new
    end
  end

  def add_menu
    @added_menu = Menu.find(params[:menu_id])

    if @added_menu
      @location.location_menus.create(menu_id: @added_menu.id)
      flash.now[:notice] = "Menus successfully added to location."
    end
    setup_add_menus
    render file: "locations/add_menu.js.erb"
  end

  def show_menus
    setup_add_menus
  end

  def remove_menu
    @location_menu = LocationMenu.find(params[:location_menu])

    if @location_menu.destroy
      flash.now[:notice] = "Menu successfully removed from #{@location.name}"
    else
      flash.now[:notice] = "Menu was not removed from #{@location.name} due to: #{@location.errors.full_messages}." 
    end
    redirect_to business_location_path(current_business, @location)
  end

  def add_image
    @location_image          = LocationImage.new(location_image_params)
    @location_image.location = @location
    @location_image.display_sequence_number = next_display_sequence_number(@location_image.location_id)

    if @location_image.save
      redirect_to business_location_path(current_business, @location), notice: "Image added successfully"
    else
      redirect_to business_location_path(current_business, @location), notice: "Image wasn't added before upload"
    end
  end

  def remove_image
    @location_image = LocationImage.find(params[:id])
    @location = @location_image.location

    if @location_image.destroy
      redirect_to business_location_path(current_business, @location)
      flash.now[:notice] = "Image successfully removed from #{@location.name}"
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to business_location_path(current_business, @location), notice: "Location updated"
    else
      redirect_to business_location_path(current_business, @location)
      flash.now[:alert] = "There was an error"
    end
  end

  def destroy    
    @location.destroy
    redirect_to business_locations_path(current_business), notice: 'Location was successfully destroyed.'
  end

  def show
    @location_image  = LocationImage.new
    @location_images = LocationImage.all
    @location_menus  = @location.location_menus
    @menus           = @business.menus
  end

  def save_sort_image
    if @location.update(location_sort_params)
      redirect_to business_location_path(current_business, @location), notice: 'Images successfully sorted.'
    else
      redirect_to business_location_path(current_business, @location), notice: 'Something went wrong.'
    end
  end

  private

  def next_display_sequence_number(location_id)
    location            = Location.find(location_id)
    @location_images    = location.location_images
    last_location_image = @location_images.last
    last_location_image ? (last_location_image .display_sequence_number + 1) : 1
  end

  def setup_add_menus
    @location_menus_names = []
    @location.location_menus.each do |location_menu|
        @location_menus_names << location_menu.menu.display_name.titleize
    end
    
    @menus = @business.menus.select do |menu|
      LocationMenu.find_by(menu_id: menu.id, location_id: @location.id).present? ? false : true
    end
  end

  def set_location
    @location = Location.find(params[:id])
    @business = @location.business
  end

  def location_params
    params[:location].permit(:name, :address, :phone_number, :open, :location_menu, :location_url, :added_menu)
  end

  def location_image_params
    params[:location_image].permit(:id, :display_sequence_number, :image)
  end

  def location_sort_params 
    params[:location].permit(location_images_attributes: [:id, :image, :display_sequence_number])
  end
end
