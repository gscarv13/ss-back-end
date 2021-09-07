module Api
  module V1
    class ActivitiesController < ApplicationController
      def index
        activities = Activity.all
        render json: ActivitiesSerializer.new(activities).as_json, status: :ok
      end
    end
  end
end
