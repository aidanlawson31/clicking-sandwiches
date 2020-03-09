class AddBusinessUrlToBusinesses < ActiveRecord::Migration[5.2]
  def change
    add_column :businesses, :business_url, :string
  end
end
