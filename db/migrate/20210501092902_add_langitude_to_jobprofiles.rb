class AddLangitudeToJobprofiles < ActiveRecord::Migration[6.0]
  def change
    change_table :jobprofiles do |t|
    t.decimal :latitude,precision: 10,scale:6
    t.decimal :langitude,precision: 10,scale:6
    end
  end
end
