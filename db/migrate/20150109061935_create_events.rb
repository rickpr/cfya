class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :day
      t.string :dinner
      t.string :lesson
      t.string :activity

      t.timestamps null: false
    end
  end
end
