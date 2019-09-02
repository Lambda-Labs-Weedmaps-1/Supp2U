class Schedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.string :sunday
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.string :saturday
      t.integer :business_id

    
      t.timestamps
    end
    
  end
end
