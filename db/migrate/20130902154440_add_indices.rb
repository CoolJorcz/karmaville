class AddIndices < ActiveRecord::Migration
   def up
    add_index :users, :first_name
    add_index :users, :last_name
    add_index :users, :username
    add_index :users, :email

    add_index :karma_points, [:user_id, :value]
    add_index :karma_points, :label
  end
end
