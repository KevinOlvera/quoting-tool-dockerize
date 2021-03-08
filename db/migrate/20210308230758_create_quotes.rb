class CreateQuotes < ActiveRecord::Migration[6.1]
  def change
    create_table :quotes do |t|
      t.string :account_name
      t.integer :quote_owner

      t.timestamps
    end
  end
end
