class UpdateEquipaments < ActiveRecord::Migration[8.0]
  def change
    remove_column :equipaments, :price, :decimal
    remove_column :equipaments, :per, :string
    rename_column :equipaments, :day, :price_per_day
  end
end
