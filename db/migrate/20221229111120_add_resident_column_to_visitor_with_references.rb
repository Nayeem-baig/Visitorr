class AddResidentColumnToVisitorWithReferences < ActiveRecord::Migration[7.0]
  def change
    add_reference :visitors, :resident, null: false, foreign_key: true
  end
end
