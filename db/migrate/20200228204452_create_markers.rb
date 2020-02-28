class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.integer :user_id
      t.string :address
      t.integer :zip_code
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
