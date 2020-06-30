class ChangeMenuItemHeadingBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    rename_column :business_display_attributes, :menu_item_heading, :menu_item_header_color
  end
end
