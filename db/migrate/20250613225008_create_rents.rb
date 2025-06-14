class CreateRents < ActiveRecord::Migration[8.0]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :equipament, null: false, foreign_key: true
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps
    end
  end
end
