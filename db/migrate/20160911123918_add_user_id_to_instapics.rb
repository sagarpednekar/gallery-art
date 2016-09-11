class AddUserIdToInstapics < ActiveRecord::Migration[5.0]
  def change
    add_column :instapics, :user_id, :integer
    add_index :instapics, :user_id
  end
end
