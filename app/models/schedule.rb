class Schedule < ApplicationRecord
  validates_presence_of :date

  belongs_to :user
  belongs_to :activity
end
