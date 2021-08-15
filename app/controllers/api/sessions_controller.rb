module Api
  class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
      user = User.find_by(email: sign_in_params['email']).try(:authenticate, sign_in_params['password'])

      if user
        session[:user_id] = user.id
        render json: {
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { status: :unauthorized }
      end
    end

    def delete
      reset_session
      render json: { status: :ok, logged_out: true }
    end

    def logged_in
      if @current_user
        render json: {
          logged_in: true,
          user: @current_user
        }
      else
        render json: { logged_in: false }
      end
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end
  end
end
