class CreateApplicationModules < ActiveRecord::Migration
  def change
    create_table :application_modules do |t|
      t.timestamps
      t.integer "application_type"
      t.string "rails_form_type"
    end
  end
end
