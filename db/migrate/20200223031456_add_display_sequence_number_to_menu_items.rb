class AddDisplaySequenceNumberToMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :display_sequence_number, :integer
  end
end
