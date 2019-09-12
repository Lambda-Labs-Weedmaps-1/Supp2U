class AddFieldsToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :fridayopen, :string
    add_column :schedules, :fridayclose, :string
  end
end
