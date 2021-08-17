module Api
  module V1
    class ActivitiesController < ApplicationController
      def index
        activities = Activity.all
        json_hash = { data: ActivitiesSerializer.new(activities).as_json }
        render json: json_hash, status: :ok
      end
    end
  end
end
