class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.references :book, foreign_key: true
      t.references :post, foreign_key: true
      t.string :caracter
      t.text :content

      t.timestamps
    end
  end
end
