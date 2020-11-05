class AddDayToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :day, :date, null: false
  end
end
