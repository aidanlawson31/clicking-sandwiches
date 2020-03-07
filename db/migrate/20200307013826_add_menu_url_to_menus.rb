class AddMenuUrlToMenus < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :menu_url, :string
  end
end
