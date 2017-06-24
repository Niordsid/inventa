class CreateOffers < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :material
      t.belongs_to :entity
      t.belongs_to :order

      t.string :order_name
      t.integer :amount
      t.time :registration_date
      t.integer :validity
      t.time :expiration_date
      t.decimal :offer_price, precision: 50, scale: 2
      t.timestamps null: false
    end
  end
end
