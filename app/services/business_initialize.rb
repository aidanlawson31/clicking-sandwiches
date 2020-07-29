module BusinessInitialize
  module_function # Allows you to call methods like class methods. E.g. Util.method. 

  def create_menu_item_tags(business_id)
    [[business_id, 'Vegan', 1],
    [business_id, 'Vetegarian', 2],
    [business_id, 'Gluten Free', 3],
    [business_id, 'Mild', 4],
    [business_id, 'Medium', 5],
    [business_id, 'Hot', 6] ].each do |tag|
      new_tag = Tag.where(business_id: tag[0], name: tag[1], display_sequence_number: tag[2]).first_or_create
    end
  end
end
