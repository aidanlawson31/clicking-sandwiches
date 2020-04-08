class AddOpenToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :open, :string
  end
end
