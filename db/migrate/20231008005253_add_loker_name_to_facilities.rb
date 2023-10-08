class AddLokerNameToFacilities < ActiveRecord::Migration[6.1]
  def change
    add_column :facilities, :loker_name, :string
  end
end
