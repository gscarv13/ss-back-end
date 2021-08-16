module Api
  module V1
    class SchedulesController < ApplicationController
      include CurrentUserConcern
      before_action :set_activity, except: %i[index create]
      before_action :check_session, except: %i[index]

      def index
        @items = Schedule.all
        render :index
      end

      def create
        item = Schedule.new(schedule_params)

        if item.save
          header :created
        else
          header :unprocessable_entity
        end
      end

      def destroy
        item = Schedule.find_by(params[:id])

        if item.destroy
          header :ok
        else
          header :unprocessable_entity
        end
      end

      private

      def schedule_params
        params.require(:schedule).permit(:user_id, :activity_id, :date)
      end
    end
  end
end
