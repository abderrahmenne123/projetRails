class CreateDemandes < ActiveRecord::Migration[6.0]
  def change
    create_table :demandes do |t|
      t.text :body
      t.string :status, default: "encours"
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps

    end
  end
end
