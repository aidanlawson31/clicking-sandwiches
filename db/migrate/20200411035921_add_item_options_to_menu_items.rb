class AddItemOptionsToMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :item_options, :boolean
  end
end
