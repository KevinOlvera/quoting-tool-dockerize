class CreateHaModels < ActiveRecord::Migration[6.1]
  def change
    create_table :ha_models do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
