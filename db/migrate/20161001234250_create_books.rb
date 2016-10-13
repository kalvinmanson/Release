class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :slug
      t.string :author
      t.string :publisher
      t.string :collection
      t.integer :pages
      t.string :isbn_10
      t.string :isbn_13
      t.text :abstract
      t.string :lang
      t.integer :condition
      t.boolean :stock
      t.integer :price
      t.string :tags
      t.integer :quality

      t.timestamps
    end
    add_index :books, :slug, unique: true
  end
end
