class ChangeStringToReferencesInVisitorModel < ActiveRecord::Migration[7.0]
  def change
    remove_column :visitors, :resident_id, :string
    add_column :visitors, :resident, :integer, references: :resident
  end
end
