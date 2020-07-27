class AddHeadingFontToBusinessDisplayAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :heading_font_id, :integer
  end
end
