class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.integer :end_user_id
      t.string :area_name
      t.text :area_introduction
      t.text :cost
      t.string :number_of_loker

      t.timestamps
    end
  end
end
