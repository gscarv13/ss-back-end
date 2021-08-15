module Api
  class SessionsController < ApplicationController
    class AuthenticationError < StandardError; end
    include CurrentUserConcern

    def create
      user = User.find_by(email: sign_in_params['email'])

      if user&.authenticate(sign_in_params['password'])
        session[:user_id] = user.id
        render json: { logged_in: true, user: user }, status: :created
      else
        render json: { error: 'Email or password is invalid' }, status: :unprocessable_entity
      end
    end

    def destroy
      reset_session
      render json: { logged_out: true }, status: :ok
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
