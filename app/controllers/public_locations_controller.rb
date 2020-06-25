class PublicLocationsController < ApplicationController
  before_action :set_business
  before_action :set_location, only: :show
  layout 'public_pages'

  def show
  end

  def index
    @locations = @business.locations
    if @locations.count == 1
      redirect_to public_location_path(@business.business_url, @locations.first.location_url)
    end
  end

  private

  def set_location
    @location = @business.locations.find_by(location_url: params[:location_url])
    render :location_not_found unless @location
  end

  def set_business
    @business = Business.find_by(business_url: params[:business_url])
    render :business_not_found unless @business
    @bda = @business.business_display_attribute
  end
end
