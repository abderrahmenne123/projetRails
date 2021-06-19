class AddUsersToJobprofiles < ActiveRecord::Migration[6.0]
  def change
    add_reference :jobprofiles, :user,  foreign_key: true
    #Ex:- :default =>''
  end
end
