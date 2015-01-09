class CreateMemberEvents < ActiveRecord::Migration
  def change
    create_table :member_events do |t|
      t.references :member, index: true
      t.references :event, index: true
      t.boolean :dinner
      t.boolean :lesson
      t.boolean :activity

      t.timestamps null: false
    end
    add_foreign_key :member_events, :members
    add_foreign_key :member_events, :events
  end
end
