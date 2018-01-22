class CreateShares < ActiveRecord::Migration[5.0]
  def change
    create_table :shares do |t|
      t.integer :user_shared_by
      t.integer :user_shared_to
      t.string :type

      t.timestamps
    end
  end
end
