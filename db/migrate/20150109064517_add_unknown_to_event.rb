class AddUnknownToEvent < ActiveRecord::Migration
  def change
    add_column :events, :unknown, :integer
  end
end
