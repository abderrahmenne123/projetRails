class AddDateDebutToDemandes < ActiveRecord::Migration[6.0]
  def change
    add_column :demandes, :date_debut, :string
  end
end
