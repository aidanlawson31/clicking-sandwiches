class RenameBusinessDisplayAttributeFields < ActiveRecord::Migration[5.2]
  def change
    rename_column :business_display_attributes, :heading_colour, :heading_color
    rename_column :business_display_attributes, :nav_bar_colour, :nav_bar_color
    rename_column :business_display_attributes, :general_text_colour, :general_text_color
  end
end
