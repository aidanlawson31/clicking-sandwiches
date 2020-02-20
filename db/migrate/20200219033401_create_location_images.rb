class CreateLocationImages < ActiveRecord::Migration[5.2]
  def change
    create_table :location_images do |t|
      t.references :location, foreign_key: true
      t.integer :display_sequence_number

      t.timestamps
    end
  end
end
