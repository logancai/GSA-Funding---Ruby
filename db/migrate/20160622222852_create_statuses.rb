class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.timestamps
      t.string "text"
      t.boolean "visible", :default => true
      t.integer "weight"
    end
    add_index("statuses","text")
  end
end
