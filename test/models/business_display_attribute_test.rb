require 'test_helper'

class BusinessDisplayAttributeTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @font     = fonts(:one)
    @business_display_attr = 
      BusinessDisplayAttribute.new(
        business_id:      @business.id,
        font_id:          @font.id,
        heading_font_id:  @font.id,
        menu_item_header_color: 'primary color',
        background_color: 'background color',
        heading_color: 'heading color',
        nav_bar_color: 'nav color',
        general_text_color: 'text color',
        hero_image_or_video: true,
        button_text_color: 'button text',
        button_color: 'button color',
        card_background_color: 'card color',
        card_border_color: 'card border',
        foreground_color: 'forground color',
        foreground_opacity: 'opacity',
      )
  end

  test "valid business display attribute" do
    assert @business_display_attr.valid?    
  end

  test "menu item header color is required" do
    @business_display_attr.menu_item_header_color = nil
    refute @business_display_attr.valid?
  end

  test "background color is required" do
    @business_display_attr.background_color = nil
    refute @business_display_attr.valid?
  end

  test "heading color is required" do
    @business_display_attr.heading_color = nil
    refute @business_display_attr.valid?
  end

  test "nav color is required" do 
    @business_display_attr.nav_bar_color = nil
    refute @business_display_attr.valid? 
  end 
end
