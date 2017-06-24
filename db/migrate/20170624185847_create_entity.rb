class CreateEntity < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.belongs_to :agent

      t.string :name
      t.string :contact_number
      t.string :address
      t.string :kind
    end
  end
end
