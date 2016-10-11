class CreateJoinTableGenderBook < ActiveRecord::Migration[5.0]
  def change
    create_join_table :genders, :books do |t|
      # t.index [:gender_id, :book_id]
      # t.index [:book_id, :gender_id]
    end
  end
end
