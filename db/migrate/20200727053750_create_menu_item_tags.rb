class CreateMenuItemTags < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_item_tags do |t|
      t.references :menu_item, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
