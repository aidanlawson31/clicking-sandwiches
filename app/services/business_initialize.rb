module BusinessInitialize
  module_function # Allows you to call methods like class methods. E.g. Util.method. 

  def create_menu_item_tags(business_id)
    [[business_id, 'Vegan'],
    [business_id, 'Vegetarian'],
    [business_id, 'Gluten Free'],
    [business_id, 'Mild'],
    [business_id, 'Medium'],
    [business_id, 'Hot'] ].each do |tag|
      new_tag = Tag.where(business_id: tag[0], name: tag[1]).first_or_create
      Utility.attach_asset_image("tag-image-#{new_tag.name.downcase.parameterize}.png", new_tag.icon)
    end
  end
end
