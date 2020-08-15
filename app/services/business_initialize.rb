module BusinessInitialize
  module_function # Allows you to call methods like class methods. E.g. Util.method. 

  def create_menu_item_tags(business_id)
    [[1, business_id, 'Vegan'],
    [2, business_id, 'Vegetarian'],
    [3, business_id, 'Gluten Free'],
    [4, business_id, 'Mild'],
    [5, business_id, 'Medium'],
    [6, business_id, 'Hot'] ].each do |tag|
      new_tag = Tag.where(display_sequence_number: tag[0], business_id: tag[1], name: tag[2]).first_or_create
      Utility.attach_asset_image("tag-image-#{new_tag.name.downcase.parameterize}.png", new_tag.icon)
    end
  end
end
