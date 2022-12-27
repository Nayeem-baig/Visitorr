class CreateResidents < ActiveRecord::Migration[7.0]
  def change
    create_table :residents do |t|
      t.string :name
      t.string :mob
      t.string :email
      t.string :flat
      t.references :space, null: false, foreign_key: true

      t.timestamps
    end
  end
end
