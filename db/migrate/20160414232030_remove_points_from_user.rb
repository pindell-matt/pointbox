class RemovePointsFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :unspent_points
    remove_column :users, :spent_points
  end
end
