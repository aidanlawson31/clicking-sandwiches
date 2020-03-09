class CreateBusinessDisplayAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :business_display_attributes do |t|
      t.references :business, foreign_key: true
      t.string :font
      t.string :primary_color
      t.string :secondary_color
      t.string :background_color

      t.timestamps
    end
  end
end
