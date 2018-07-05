class CreateManagers < ActiveRecord::Migration[5.1]
  def change
    create_table :managers do |t|
      t.integer :manager_id
      t.integer :user_id

      t.timestamps
    end
  end
end
