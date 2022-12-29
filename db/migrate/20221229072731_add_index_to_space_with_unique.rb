class AddIndexToSpaceWithUnique < ActiveRecord::Migration[7.0]
  def change
    add_index :spaces, :user_id, unique: true
  end
end
