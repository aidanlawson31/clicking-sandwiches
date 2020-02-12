class CreateLocationMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :location_menus do |t|
      t.references :location, foreign_key: true
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end

  def change
    create_join_table :location, :users
  end
end
