class RemoveDisplaySequenceNumberFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :display_sequence_number, :integer
  end
end
