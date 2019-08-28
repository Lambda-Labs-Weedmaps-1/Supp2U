class Items < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :menu_id
      t.string :item_name
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
