class AddItemTagBooleanToMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :item_tags, :boolean
  end
end
