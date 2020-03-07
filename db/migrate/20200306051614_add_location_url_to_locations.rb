class AddLocationUrlToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :location_url, :string
  end
end
