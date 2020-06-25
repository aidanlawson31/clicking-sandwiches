class AddRepeatAndForegroundFieldsToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :repeat, :boolean
    add_column :business_display_attributes, :foreground_color, :string
    add_column :business_display_attributes, :foreground_opacity, :string
  end
end
