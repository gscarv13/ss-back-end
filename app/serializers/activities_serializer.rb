class ActivitiesSerializer
  def initialize(activities)
    @activities = activities
  end

  def as_json
    @activities.map do |act|
      {
        'id' => act.id,
        'activity_type' => act.activity_type,
        'title' => act.title,
        'description' => act.description,
        'level' => act.level
      }
    end
  end
end
