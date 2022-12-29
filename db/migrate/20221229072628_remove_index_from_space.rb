class RemoveIndexFromSpace < ActiveRecord::Migration[7.0]
  def change
    remove_index :spaces, :user_id
  end
end
