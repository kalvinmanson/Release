class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :city, foreign_key: true
      t.string :name
      t.string :slug
      t.string :avatar
      t.string :rol
      t.float :rank
      t.string :gender
      t.date :bithdate
      t.boolean :banned
      t.date :banned_date
      t.boolean :active

      t.timestamps
    end
    add_index :users, :slug, unique: true
  end
end
