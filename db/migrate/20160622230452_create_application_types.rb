class CreateApplicationTypes < ActiveRecord::Migration
  def change
    create_table :application_types do |t|
      t.timestamps
      t.string "full_name"
      t.string "short_name"
      t.boolean "on_our_site", :default=> true
      t.text "url"
      t.boolean "visible", :default => false
    end
    add_index("application_types","short_name")
  end
end
