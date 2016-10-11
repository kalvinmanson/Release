class CreatePaymments < ActiveRecord::Migration[5.0]
  def change
    create_table :paymments do |t|
      t.references :user, foreign_key: true
      t.float :ammount
      t.float :shipping
      t.float :cost
      t.text :detail_products
      t.text :detail_paymment
      t.text :detail_shipping
      t.boolean :state_payed
      t.boolean :state_shipped
      t.boolean :state_take

      t.timestamps
    end
  end
end
