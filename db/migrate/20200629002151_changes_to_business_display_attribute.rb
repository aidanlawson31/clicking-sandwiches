class ChangesToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    rename_column :business_display_attributes, :primary_color, :menu_item_heading
    remove_column :business_display_attributes, :secondary_color
  end
end
