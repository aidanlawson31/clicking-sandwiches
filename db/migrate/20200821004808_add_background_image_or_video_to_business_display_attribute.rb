class AddBackgroundImageOrVideoToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :background_image_or_color, :boolean

    reversible do |change|
      change.up do
        execute "update business_display_attributes set background_image_or_color = true"
      end
    end
  end
end
