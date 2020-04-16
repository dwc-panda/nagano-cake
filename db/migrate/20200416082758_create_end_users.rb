class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string "first_name"
      t.string "last_name"
      t.string "first_kana_name"
      t.string "last_kana_name"
      t.string "postcode"
      t.string "address"
      t.string "phone_number"
      # t.boolean "is_deleted"

      t.timestamps
    end
  end
end
