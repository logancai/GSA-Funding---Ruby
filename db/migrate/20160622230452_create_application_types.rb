class CreateApplicationTypes < ActiveRecord::Migration
  def change
    create_table :application_types do |t|
      t.timestamps
      t.string "full_name"
      t.string "short_name"
      t.boolean "on_our_site", :default=> true
      t.text "url"
      t.text "description"
      t.boolean "visible", :default => false
    end
    add_index("application_types","short_name")

    #Initial ApplicationType
    ApplicationType.create(:full_name=>"GSA Publications", :short_name=>"GSAPUBS", :visible=>true)
  end
end
