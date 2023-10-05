class AddUpdateToEndUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :end_users, :family_name, :string, default: "", null: false
    add_column :end_users, :first_name, :string, default: "", null: false
    add_column :end_users, :family_name_kana, :string, default: "", null: false
    add_column :end_users, :first_name_kana, :string, default: "", null: false
    add_column :end_users, :nick_name, :string, default: "", null: false
    add_column :end_users, :is_deleted, :boolean, null: false, default: false
  end
end
