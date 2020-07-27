class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :business, foreign_key: true
      t.string :name
      t.integer :display_sequence_number

      t.timestamps
    end
  end
end
