class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.belongs_to :categoria
      t.string :materialname
      t.integer :cantidad
      t.decimal :purchase_price, precision: 50, scale: 2
      t.decimal :sale_price, precision: 50, scale: 2
      t.decimal :transport_price, precision: 50, scale: 2
      t.timestamps null: false


    end
  end
end
