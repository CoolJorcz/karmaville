class RemoveLastIndex < ActiveRecord::Migration
  def up
    remove_index :users, :total_karma
  end

  def down
  end
end
