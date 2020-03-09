class PublicMenusController < ApplicationController
  before_action :set_menu
  
  def show
    @business = Business.find_by(business_url: params[:business_url])
    @location = Location.find_by(location_url: params[:location_url])
  end

  private

  def set_menu
    @menu = Menu.find_by(menu_url: params[:menu_url])
    unless @menu
      render :menu_not_found
    end    
  end
end
