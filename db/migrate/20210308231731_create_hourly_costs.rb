class CreateHourlyCosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hourly_costs do |t|
      t.integer :lead_architect
      t.integer :design_engineer
      t.integer :network_integration
      t.integer :technical_project_manager

      t.timestamps
    end
  end
end
