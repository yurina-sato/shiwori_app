class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name,         null: false
      t.text :text
      t.date :day,            null: false
      t.time :start_time,     null: false
      t.time :finish_time,    null: false
      t.text :place
      t.text :url
      t.integer :price
      t.references :schedule, null: false, foreign_key: true
      t.timestamps
    end
  end
end

