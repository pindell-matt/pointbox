class RemoveSpentFromPoints < ActiveRecord::Migration
  def change
    remove_column :points, :spent
  end
end
