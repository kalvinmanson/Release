class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
