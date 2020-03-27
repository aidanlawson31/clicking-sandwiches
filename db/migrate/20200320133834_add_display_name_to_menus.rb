class AddDisplayNameToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :display_name, :string
    rename_column :menus, :name, :internal_name
  end
end
