class AddFontToBusinessDisplayAttributes < ActiveRecord::Migration[5.2]
  def change
    add_reference :business_display_attributes, :font, foreign_key: true
    remove_column :business_display_attributes, :font
  end
end
