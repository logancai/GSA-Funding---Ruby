class CreateApplicationTypeDirectors < ActiveRecord::Migration
  def change
    create_table :application_type_directors do |t|
      t.timestamps
      t.integer "application_type"
      t.integer "advisor"
    end
  end
end
