class CreateVisitors < ActiveRecord::Migration[7.0]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :mob
      t.string :address
      t.string :resident_id
      t.references :space, null: false, foreign_key: true
      t.string :reason
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
