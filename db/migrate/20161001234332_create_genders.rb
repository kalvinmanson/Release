class CreateGenders < ActiveRecord::Migration[5.0]
  def change
    create_table :genders do |t|
      t.string :name
      t.string :slug
      t.string :name_en

      t.timestamps
    end
    add_index :genders, :slug, unique: true
  end
end
