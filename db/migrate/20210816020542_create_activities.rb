class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities, id: :uuid do |t|
      t.string :title
      t.string :activity_type
      t.string :level
      t.text :description

      t.timestamps
    end
  end
end
