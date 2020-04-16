class AddIsDaletedToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_deleted, :boolean, default: false, null: false
  end
end
