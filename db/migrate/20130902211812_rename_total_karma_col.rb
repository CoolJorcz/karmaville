class RenameTotalKarmaCol < ActiveRecord::Migration
  def up
    rename_column :users, :total_karma, :karma_sum
  end

  def down
  end
end
