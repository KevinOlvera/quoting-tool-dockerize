class CreateNuageVersions < ActiveRecord::Migration[6.1]
  def change
    create_table :nuage_versions do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
