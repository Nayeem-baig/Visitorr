class RemoveResidentColumnFromVisitor < ActiveRecord::Migration[7.0]
  def change
    remove_column :visitors, :resident
  end
end
