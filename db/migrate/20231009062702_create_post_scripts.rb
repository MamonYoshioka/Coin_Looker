class CreatePostScripts < ActiveRecord::Migration[6.1]
  def change
    create_table :post_scripts do |t|
      t.integer :end_user_id
      t.integer :facility_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
