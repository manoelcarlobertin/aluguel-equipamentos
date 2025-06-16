class CreateSchedules < ActiveRecord::Migration[8.0]
  def change
    create_table :schedules do |t|
      t.references :equipament, null: false, foreign_key: true
      t.string :status, default: 'pending' # approved, in_progress, done
      t.date :period_start, null: false
      t.date :period_end

      t.timestamps
    end
    add_index :schedules, :status
  end
end
