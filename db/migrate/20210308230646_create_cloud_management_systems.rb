class CreateCloudManagementSystems < ActiveRecord::Migration[6.1]
  def change
    create_table :cloud_management_systems do |t|
      t.string :name
      t.integer :value

      t.timestamps
    end
  end
end
