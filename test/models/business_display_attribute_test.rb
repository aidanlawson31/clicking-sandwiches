require 'test_helper'

class BusinessDisplayAttributeTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @font     = fonts(:one)
    @business_display_attr = 
      BusinessDisplayAttribute.new(
        business_id:      @business.id,
        font_id:          @font.id,
        primary_color:    'primary color',
        secondary_color:  'secondary color',
        background_color: 'background color',
        heading_color: 'heading color',
        nav_bar_color: 'nav color',
        general_text_color: 'text color'
      )
  end

  test "valid business display attribute" do
    assert @business_display_attr.valid?    
  end

  test "primary color is required" do
    @business_display_attr.primary_color = nil
    refute @business_display_attr.valid?
  end

  test "secondary color is required" do
    @business_display_attr.secondary_color = nil
    refute @business_display_attr.valid?
  end

  test "background color is required" do
    @business_display_attr.background_color = nil
    refute @business_display_attr.valid?
  end
end
