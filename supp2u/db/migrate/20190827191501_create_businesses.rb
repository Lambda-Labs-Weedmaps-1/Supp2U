class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :theme
      t.boolean :recommended

      t.timestamps
    end
  end
end
