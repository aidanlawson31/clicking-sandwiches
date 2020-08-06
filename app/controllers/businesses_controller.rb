class BusinessesController < ApplicationController
  before_action :authenticate_user!
  before_action :form_setup, only: [:update, :show, :update_business_display_attribute]

  def update_business_display_attribute
    if @business_display_attribute.update(business_display_attribute_params)
      redirect_to business_path(@business), notice: "Business display attributes saved successfully."
    else
      redirect_to business_path(@business), notice: "Business display attributes failed to save."
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      current_user.update_attributes(business_id: @business.id)
      BusinessInitialize.create_menu_item_tags(@business.id)
      redirect_to @business, notice: "Business created successfully."
    else
      render :new
    end
  end

  def update    
    if @business.update(business_params)
      redirect_to business_path(@business), notice: "Business updated successfully."
    else
      render :show 
    end
  end

  def destroy
    @business.destroy
    redirect_to new_business_path, notice: 'Business was successfully destroyed.'
  end

  def show
  end

  private

  def form_setup
    @business                   = current_user.business
    @business_display_attribute = @business.business_display_attribute
    @fonts                      = Font.all
  end

  def business_display_attribute_params
    params[:business_display_attribute].permit(:business_id, :menu_item_header_color, :background_color, :font_id, :heading_color, 
      :general_text_color, :nav_bar_color, :button_text_color, :button_color, :card_background_color, :card_border_color, :foreground_color,
      :foreground_opacity, :repeat, :background_color, :banner, :favicon, :background_image, :hero_image, :hero_image_or_video, :heading_font_id,
      :hero_video, :remove_hero_video, :top_icon, :remove_hero_image, :remove_top_icon, :remove_background_image, :remove_banner, :remove_favicon
    )
  end

  def business_params
    params[:business].permit(:name, :email, :phone_number, :description, :business_url)
  end
end
