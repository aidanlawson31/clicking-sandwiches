class AddDisplaySequenceNumberToMenuItemTags < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_item_tags, :display_sequence_number, :integer
  end
end
