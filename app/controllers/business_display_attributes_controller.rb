class BusinessDisplayAttributesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_business_display_attribute

  def edit
  end
  
  def update
    @business = @business_display_attribute.business

    if @business_display_attribute.update(business_display_attribute_params)
      redirect_to business_path(@business)
    end
  end

  private

  def set_business_display_attribute
    @business_display_attribute = BusinessDisplayAttribute.find(params[:id])
  end

  def business_display_attribute_params
    params[:business_display_attribute].permit(:business_id, :primary_color, :secondary_color, :background_color, :font_id)
  end
end
