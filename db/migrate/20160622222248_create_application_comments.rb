class CreateApplicationComments < ActiveRecord::Migration
  def change
    create_table :application_comments do |t|
      t.timestamps
      t.integer "application_id"
      t.integer "owner"
      t.text "comment"
    end
  end
end
