class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :city, foreign_key: true
      t.string :name
      t.string :slug
      t.string :avatar
      t.string :rol, default: "User"
      t.float :rank
      t.string :gender
      t.date :bithdate
      t.boolean :banned
      t.date :banned_date
      t.boolean :active
      t.integer :followees_count, default: 0
      t.integer :followers_count, default: 0
      t.integer :likees_count, default: 0
      t.integer :likers_count, default: 0
      t.integer :mentionees, default: 0
      t.integer :mentioners_count, default: 0

      t.timestamps
    end
    add_index :users, :slug, unique: true
  end
end
