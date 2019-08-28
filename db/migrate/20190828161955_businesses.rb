class Businesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :website
      t.string :city
      t.string :state
      t.string :street
      t.integer :zipcode
      t.integer :building_number
      t.string :theme
      t.string :description
      t.string :hours
      t.boolean :recommended

      t.timestamps
    end
  end
end
