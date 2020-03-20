class AddPhoneNumberToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :phone_number, :string
  end
end
