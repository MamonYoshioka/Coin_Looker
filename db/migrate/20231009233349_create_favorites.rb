class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :end_user_id
      t.integer :post_script_id

      t.timestamps
    end
  end
end
