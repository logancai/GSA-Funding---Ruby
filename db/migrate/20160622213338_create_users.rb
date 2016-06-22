class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.timestamps
      t.string "first_name"
      t.string "last_name"
      t.string "email", :default => ""
      t.string "box_user_id"
      t.boolean "disabled", :default => false
      t.boolean "advisor", :default => false
      t.boolean "fund_director", :default => false
      t.boolean "rights_to_reports", :default => false
      t.boolean "rights_to_edit", :default => false
      t.boolean "rights_to_manage_users", :default => false
      t.boolean "rights_to_admin", :default => false
    end
    add_index("users","email")
  end
end
