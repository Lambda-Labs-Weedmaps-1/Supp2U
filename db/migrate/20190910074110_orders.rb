class Orders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :customer_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
