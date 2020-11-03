class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name,        null: false
      t.text :text,          null: false
      t.string :destination, null: false
      t.date :start_day,     null: false
      t.date :finish_day,    null: false
      t.timestamps
    end
  end
end
