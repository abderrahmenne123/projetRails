class CreatePlannings < ActiveRecord::Migration[6.0]
  def change
    create_table :plannings do |t|
      t.string :date_debut
      t.string :date_fin
      t.string :status

      t.timestamps
    end
  end
end
