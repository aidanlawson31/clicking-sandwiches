class AddDisplaySequenceNumberToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :display_sequence_number, :integer
  end
end
