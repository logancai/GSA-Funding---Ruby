class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.timestamps
      t.string "text"
      t.boolean "visible", :default => true
      t.integer "weight"
      t.boolean "assignable_by_user", :default => false
      t.boolean "assignable_by_advisor", :default => true
    end
    add_index("statuses","text")

    #Included Statuses
    Status.create(:text => "Started", :visible => false, :weight=>0, :assignable_by_advisor => false)
    Status.create(:text => "Please Review", :weight=>1, :assignable_by_user => true, :assignable_by_advisor => false)
    Status.create(:text => "Approved", :weight=>2, :assignable_by_advisor => true)
    Status.create(:text => "Denied", :weight=>3, :assignable_by_advisor => true)
    Status.create(:text => "Edits Required", :weight=>4, :assignable_by_advisor => true)
    Status.create(:text => "Edits Completed", :weight=>5, :assignable_by_user => true, :assignable_by_advisor => false)
    Status.create(:text => "Funding Allocated", :weight=>6, :assignable_by_advisor => true)
  end
end
