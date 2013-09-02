class ChangeUsers < ActiveRecord::Migration
  def up
    add_column :users, :total_karma, :integer
  end

  def down
    remove_column :users, :karma_count, :integer
  end
end
