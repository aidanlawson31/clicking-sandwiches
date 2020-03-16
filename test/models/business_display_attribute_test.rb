require 'test_helper'

class BusinessDisplayAttributeTest < ActiveSupport::TestCase
  def setup
    @business = businesses(:one)
    @font     = fonts(:one)
    @business_display_attr = 
      BusinessDisplayAttribute.new(
        business_id:      @business.id,
        font_id:          @font.id,
        primary_color:    'primary colour',
        secondary_color:  'secondary colour',
        background_color: 'background colour'
      )
  end

  test "valid business display attribute" do
    assert @business_display_attr.valid?    
  end

  test "primary colour is required" do
    @business_display_attr.primary_color = nil
    refute @business_display_attr.valid?
  end

  test "secondary colour is required" do
    @business_display_attr.secondary_color = nil
    refute @business_display_attr.valid?
  end

  test "background colour is required" do
    @business_display_attr.background_color = nil
    refute @business_display_attr.valid?
  end
end
