module Api
  module V1
    class ActivitiesController < ApplicationController
      def index
        activities = Activity.all
        render json: { activities: activities }, status: :ok
      end

      def create
        activity = Activity.new(activity_params)

        if activity.save
          header :created
        else
          render json: { error: activity.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        activity = Activity.find(params[:id])

        if activity.destroy
          header :ok
        else
          header :unprocessable_entity
        end
      end

      def update
        activity = Activity.find(params[:id])

        if activity.update(activity_params)
          header :ok
        else
          header :unprocessable_entity
        end
      end

      private

      def activity_params
        params.require(:activity).permit(:title, :description, :activity_type, :level)
      end
    end
  end
end
