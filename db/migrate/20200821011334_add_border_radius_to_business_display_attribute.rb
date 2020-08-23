class AddBorderRadiusToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :card_border_radius, :integer

    reversible do |change|
      change.up do
        execute "update business_display_attributes set card_border_radius = 2"
      end
    end
  end
end
