class AddFieldsToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :sundayopen, :string
    add_column :schedules, :sundayclose, :string
    add_column :schedules, :mondayopen, :string
    add_column :schedules, :mondayclose, :string
    add_column :schedules, :tuesdayopen, :string
    add_column :schedules, :tuesdayclose, :string
    add_column :schedules, :wednesdayopen, :string
    add_column :schedules, :wednesdayclose, :string
    add_column :schedules, :thursdayopen, :string
    add_column :schedules, :thursdayclose, :string
  end
end
