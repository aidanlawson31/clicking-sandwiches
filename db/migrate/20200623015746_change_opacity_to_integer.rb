class ChangeOpacityToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :business_display_attributes, :foreground_opacity, :integer, using: 'foreground_opacity::integer'
  end
end
