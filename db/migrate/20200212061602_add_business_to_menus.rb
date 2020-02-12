class AddBusinessToMenus < ActiveRecord::Migration[5.2]
  def change
    add_reference :menus, :business, foreign_key: true, index: true
  end
end
