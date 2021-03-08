class CreateQtyRanges < ActiveRecord::Migration[6.1]
  def change
    create_table :qty_ranges do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
