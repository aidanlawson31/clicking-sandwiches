class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean
    add_reference :users, :business, foreign_key: true
  end
end
