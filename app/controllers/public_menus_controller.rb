class PublicMenusController < ApplicationController
  before_action :setup
  
  def show
  end

  private

  def setup
    @menu     = Menu.find_by(menu_url: params[:menu_url])
    render    :menu_not_found unless @menu
    @business = Business.find_by(business_url: params[:business_url])
    @location = Location.find_by(location_url: params[:location_url]) 
  end
end
