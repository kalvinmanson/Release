class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.references :paymment, foreign_key: true
      t.references :user, foreign_key: true
      t.text :comment
      t.integer :rank

      t.timestamps
    end
  end
end
