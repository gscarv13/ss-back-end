class ChangeDateColumnTypeInSchedules < ActiveRecord::Migration[6.1]
  change_table :schedules do |t|
    t.change :date, :string
  end
end
