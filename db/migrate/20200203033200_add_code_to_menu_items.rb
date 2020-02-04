class AddCodeToMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :code, :integer
    add_index :menu_items, :code
  end
end
