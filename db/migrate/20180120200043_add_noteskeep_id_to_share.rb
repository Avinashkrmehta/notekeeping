class AddNoteskeepIdToShare < ActiveRecord::Migration[5.0]
  def change
    add_column :shares, :noteskeep_id, :integer
  end
end
