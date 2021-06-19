class CreateJobprofiles < ActiveRecord::Migration[6.0]
  def change
    create_table :jobprofiles do |t|
      t.string :adresse
      t.string :ville
      t.string :gallery
      t.bigint :tarif

      t.timestamps
    end
  end
end
