module Api
  module V1
    class UserSchedulesController < ApplicationController
      def index
        user = User.find(params[:user])
        items = if params[:activity]
                  schedules = user.schedules.where(activity_id: params[:activity])
                  UserSchedulesSerializer.new(schedules).as_json
                else
                  UserSchedulesSerializer.new(user.schedules, true).as_json_activities
                end
        render json: items
      end
    end
  end
end
