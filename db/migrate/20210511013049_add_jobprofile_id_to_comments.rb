class AddJobprofileIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :jobprofile_id, :integer
  end
end
