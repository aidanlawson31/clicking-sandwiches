class AddFieldsToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :button_text_color, :string
    add_column :business_display_attributes, :button_color, :string
    add_column :business_display_attributes, :card_background_color, :string
    add_column :business_display_attributes, :card_border_color, :string
  end
end
