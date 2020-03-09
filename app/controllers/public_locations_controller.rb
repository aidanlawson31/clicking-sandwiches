class PublicLocationsController < ApplicationController
  before_action :set_location, only: :show
  before_action :set_business, only: :index

  def show
    @business = @location.business
  end

  def index
    @locations = @business.locations
    if @locations.count < 2
      redirect_to public_location_path(@business.business_url, @locations.first.location_url)
    end
  end

  private

  def set_location
    @location = Location.find_by(location_url: params[:location_url])
    unless @location
      render :location_not_found
    end    
  end

  def set_business
    @business  = Business.find_by(business_url: params[:business_url])
    unless @business
      render :business_not_found
    end    
  end
end
