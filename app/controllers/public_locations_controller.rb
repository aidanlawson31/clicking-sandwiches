class PublicLocationsController < ApplicationController
  before_action :set_location, only: :show
  before_action :set_business

  def show
    puts "ALAL#{@business.locations.first}"
    puts "ALAL2#{@business.locations}"
  end

  def index
    @locations = @business.locations
    if @locations.count == 1
      redirect_to public_location_path(@business.business_url, @locations.first.location_url)
    end
  end

  private

  def set_location
    @location = Location.find_by(location_url: params[:location_url])
    render :location_not_found unless @location
  end

  def set_business
    @business = Business.find_by(business_url: params[:business_url])
    render :business_not_found unless @business
  end
end
