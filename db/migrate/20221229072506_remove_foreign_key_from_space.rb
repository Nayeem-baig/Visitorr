class RemoveForeignKeyFromSpace < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :spaces, column: :user_id
  end
end
