class CreateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :shipments do |t|
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :builing
      t.string :phone_number, null: false
      t.integer :prefecture_id, null: false
      t.references :purchase, null: false , foreing_key: true
      t.timestamps
    end
  end
end