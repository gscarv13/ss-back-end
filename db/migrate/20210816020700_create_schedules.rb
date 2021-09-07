class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules, id: :uuid do |t|
      t.belongs_to :user, type: :uuid, foreign_key: true, index: true
      t.belongs_to :activity, type: :uuid, index: true
      t.datetime :date

      t.timestamps
    end
  end
end
