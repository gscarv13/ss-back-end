class UserSchedulesSerializer
  def initialize(schedules, with_activity = nil)
    @schedules = schedules
    @activities = Activity.all.pluck(:id, :title) if with_activity
  end

  def as_json_activities
    @schedules.map do |schedule|
      {
        'id' => schedule.id,
        'activity' => @activities.select { |entry| entry.last if entry[0] == schedule.activity_id }.flatten,
        'date' => schedule.date
      }
    end
  end

  def as_json
    @schedules.map do |schedule|
      {
        'id' => schedule.id,
        'date' => schedule.date
      }
    end
  end
end
