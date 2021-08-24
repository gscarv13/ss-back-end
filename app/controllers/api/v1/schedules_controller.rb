module Api
  module V1
    class SchedulesController < ApplicationController
      def index
        items = Schedule.where(schedule_params)
        render json: SchedulesSerializer.new(items).as_json
      end

      def create
        item = Schedule.new(schedule_params)

        if item.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      def destroy
        item = Schedule.find_by(id: params[:id])

        if item
          item.destroy
          head :ok
        else
          head :unprocessable_entity
        end
      end

      private

      def schedule_params
        params.require(:schedule).permit(:user_id, :activity_id, :date)
      end
    end
  end
end
