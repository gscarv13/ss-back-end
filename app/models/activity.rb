class Activity < ApplicationRecord
  validates_presence_of :title, :activity_type, :level, :description

  has_many :schedules
end
