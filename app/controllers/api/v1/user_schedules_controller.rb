module Api
  module V1
    class UserSchedulesController < ApplicationController
      def index
        items = User.find(params[:user]).schedules.where(activity_id: params[:activity])
        render json: items
      end
    end
  end
end
