module Api
  class RegistrationsController < ApplicationController
    def create
      user = User.new(user_params)

      if user.save
        session[:user_id] = user.id
        render json: { user: user }, status: :created
      else
        render json: { error: user.errors }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
