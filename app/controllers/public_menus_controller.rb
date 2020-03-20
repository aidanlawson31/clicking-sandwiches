class PublicMenusController < ApplicationController
  before_action :setup
  
  def show
  end

  private

  def setup
    @business = Business.find_by(business_url: params[:business_url])
    render    :business_not_found and return unless @business
    @location = @business.locations.find_by(location_url: params[:location_url])
    render    :location_not_found and return unless @location
    @location_menus = @location.location_menus.select do |location_menu|
      location_menu.menu.menu_url == params[:menu_url]
    end
    @menu = @location_menus.first&.menu
    render :menu_not_found and return unless @menu
  end
end
