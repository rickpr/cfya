class AddCategoryToMember < ActiveRecord::Migration
  def change
    add_column :members, :category, :integer
  end
end
