class CreatePostScriptComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_script_comments do |t|
      t.text :comment
      t.integer :end_user_id
      t.integer :post_script_id

      t.timestamps
    end
  end
end
