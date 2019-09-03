class Customers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :user_id
      t.string :custname

      t.timestamps
    end
  end
end
