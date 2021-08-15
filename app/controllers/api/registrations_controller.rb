module Api
  module V1
    class RegistrationsController < ApplicationController
      def create
        user = User.create!(user_params)

        if user
          session[:user_id] = user.id
          render json: { status: :created, user: user }
        else
          render json: { status: :unprocessable_entity }
        end
      end

      private

      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
      end
    end
  end
end
