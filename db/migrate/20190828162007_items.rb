class Items < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :menu_id
      t.string :item_name
      t.float  :price
      t.string :category
      t.string :description
      t.integer :cals

      t.timestamps
    end
  end
end
