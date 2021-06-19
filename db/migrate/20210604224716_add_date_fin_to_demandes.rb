class AddDateFinToDemandes < ActiveRecord::Migration[6.0]
  def change
    add_column :demandes, :date_fin, :string
  end
end
