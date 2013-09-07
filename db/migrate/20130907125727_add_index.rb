class AddIndex < ActiveRecord::Migration
  def up
    add_index :users, :foursq_id
  end

  def down
    remove_index :users, :foursq_id
  end
end
