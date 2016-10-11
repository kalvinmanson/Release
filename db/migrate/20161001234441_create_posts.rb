class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :category, foreign_key: true
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :slug
      t.text :content
      t.text :description
      t.string :tags

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
