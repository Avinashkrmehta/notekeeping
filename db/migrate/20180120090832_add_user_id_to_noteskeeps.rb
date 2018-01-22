class AddUserIdToNoteskeeps < ActiveRecord::Migration[5.0]
  def change
    add_column :noteskeeps, :user_id, :integer
  end
end
