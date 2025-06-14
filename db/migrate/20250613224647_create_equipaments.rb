class CreateEquipaments < ActiveRecord::Migration[8.0]
  def change
    create_table :equipaments do |t|
      t.string :name
      t.text :description
      t.boolean :available
      t.string :price
      t.string :per
      t.integer :day

      t.timestamps
    end
  end
end
