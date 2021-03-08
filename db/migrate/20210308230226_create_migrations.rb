class CreateMigrations < ActiveRecord::Migration[6.1]
  def change
    create_table :migrations do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
