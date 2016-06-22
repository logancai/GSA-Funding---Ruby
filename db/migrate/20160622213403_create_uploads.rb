class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.timestamps
      t.integer "owner"
      t.string "file_name"
      t.string "box_file_id", :default => ""
      t.string "box_url", :default => ""
    end
  end
end
