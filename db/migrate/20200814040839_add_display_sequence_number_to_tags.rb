class AddDisplaySequenceNumberToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :display_sequence_number, :integer
  end
end
