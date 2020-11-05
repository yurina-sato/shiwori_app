class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.references :trip, null: false, foreign_key: true
      t.timestamps
    end
  end
end
