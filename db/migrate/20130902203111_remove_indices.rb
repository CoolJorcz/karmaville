class RemoveIndices < ActiveRecord::Migration
   def up
    remove_index :users, :first_name
    remove_index :users, :last_name
    remove_index :users, :username
    remove_index :users, :email
    remove_index :karma_points, :label
    remove_column :users, :karma_count
  end
end
