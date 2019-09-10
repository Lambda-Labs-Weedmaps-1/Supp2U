class Carts < ActiveRecord::Migration[5.2]
  def change

    create_table :carts do |thingy|
      
      thingy.integer :customer_id
      thingy.integer :business_id
      thingy.integer :item_numbers, array: true, default: []
      thingy.integer :quantity

      thingy.timestamps
    end 

  end
end
