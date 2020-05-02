class CreateMenuItemOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_item_options do |t|
      t.references :menu_item, foreign_key: true
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
