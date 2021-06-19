class AddJobprofileIdToDemandes < ActiveRecord::Migration[6.0]
  def change
    add_column :demandes, :jobprofile_id, :integer
  end
end
