class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :location, foreign_key: true
      t.string :name
      t.datetime :time
      t.integer :number_of_people
      t.text :requirements
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
