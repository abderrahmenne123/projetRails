class AddJobprofileIdToPlannings < ActiveRecord::Migration[6.0]
  def change
    add_column :plannings, :jobprofile_id, :integer
  end
end
