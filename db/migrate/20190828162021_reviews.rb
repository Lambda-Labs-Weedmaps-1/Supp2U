class Reviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :business_id
      t.string :review
      t.float :rating

      t.timestamps
    end
  end
end
