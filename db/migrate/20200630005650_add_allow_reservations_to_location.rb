class AddAllowReservationsToLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :allow_reservations, :boolean
  end
end
