module Api
  module V1
    class ActivitiesController < ApplicationController
      def index
        @activities = Activity.all
        render :index, status: :ok
      end
    end
  end
end
