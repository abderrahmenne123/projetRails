class AddNamejobToJobprofiles < ActiveRecord::Migration[6.0]
  def change
    add_column :jobprofiles, :namejob, :string
  end
end
