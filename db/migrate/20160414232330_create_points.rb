class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :value
      t.references :user, index: true, foreign_key: true
      t.boolean :spent
    end
  end
end
