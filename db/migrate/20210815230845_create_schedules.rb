class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :activity_id
      t.datetime :date

      t.timestamps
    end
  end
end
