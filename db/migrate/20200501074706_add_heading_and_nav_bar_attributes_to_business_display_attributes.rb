class AddHeadingAndNavBarAttributesToBusinessDisplayAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :heading_colour, :string
    add_column :business_display_attributes, :nav_bar_colour, :string
    add_column :business_display_attributes, :general_text_colour, :string
  end
end
