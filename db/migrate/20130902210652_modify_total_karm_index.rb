class ModifyTotalKarmIndex < ActiveRecord::Migration
  def up
    remove_index :karma_points, :value
    add_index :karma_points, [:user_id, :value]
  end

  def down
  end
end
