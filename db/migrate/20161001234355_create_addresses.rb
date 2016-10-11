class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :phone
      t.string :movil
      t.string :address
      t.string :address_detail
      t.integer :zipcode

      t.timestamps
    end
  end
end
