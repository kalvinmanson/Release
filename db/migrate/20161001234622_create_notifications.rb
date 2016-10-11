class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :user, foreign_key: true
      t.references :rank, foreign_key: true
      t.references :paymment, foreign_key: true
      t.references :book, foreign_key: true
      t.string :caracter
      t.string :content
      t.boolean :checked

      t.timestamps
    end
  end
end
