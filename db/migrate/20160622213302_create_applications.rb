class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.timestamps
      t.integer "year"
      t.string "quarter"
      t.integer "application_type" #determins the questions to ask
      t.integer "owner_id"
      t.integer "advisor_id"
      t.string "organization"
      t.boolean "is_signatory"
      t.integer "status"
    end
    add_index("applications","owner_id")
    add_index("applications","advisor_id")
    add_index("applications","organization")
    add_index("applications","status")
  end
end
