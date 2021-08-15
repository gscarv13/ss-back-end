class Activity < ApplicationRecord
  validates_presence_of :title, :activity_type, :level, :description
end
