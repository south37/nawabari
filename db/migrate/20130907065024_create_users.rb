class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :foursq_id
      t.float :territory

      t.timestamps
    end
  end
end
