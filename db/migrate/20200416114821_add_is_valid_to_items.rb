class AddIsValidToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :is_valid, :boolean, default: false, null: false
  end
end
