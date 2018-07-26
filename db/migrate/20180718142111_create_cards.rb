class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :card_type
      t.integer :points
      t.text :description

      t.timestamps
    end
  end
end
