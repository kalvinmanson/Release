class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :book, foreign_key: true
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :parent_id
      t.text :content

      t.timestamps
    end
  end
end
