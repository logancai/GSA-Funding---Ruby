class CreateApplicationFlows < ActiveRecord::Migration
  def change
    create_table :application_flows do |t|
      t.timestamps
      t.string "object_to_read"
      t.string "condition"
      t.string "action"
    end
  end
end
