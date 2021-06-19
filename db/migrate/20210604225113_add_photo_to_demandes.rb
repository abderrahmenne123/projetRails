class AddPhotoToDemandes < ActiveRecord::Migration[6.0]
  def change
    add_column :demandes, :photo, :string
  end
end
