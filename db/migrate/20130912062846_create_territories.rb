class CreateTerritories < ActiveRecord::Migration
  def change
    create_table :territories do |t|
      t.float :lat
      t.float :lng
      t.string :name
      t.integer :been_here
      t.string :venue_id
      t.references :user

      t.timestamps
    end
    add_index :territories, :user_id
  end
end
