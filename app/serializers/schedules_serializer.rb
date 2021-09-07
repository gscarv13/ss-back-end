class SchedulesSerializer
  def initialize(schedules)
    @schedules = schedules
  end

  def as_json
    @schedules.map do |sch|
      {
        'id' => sch.id,
        'date' => sch.date
      }
    end
  end
end
