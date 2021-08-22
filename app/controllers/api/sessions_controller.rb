module Api
  class SessionsController < ApplicationController
    include CurrentUserConcern

    def create
      user = User.find_by(email: sign_in_params['email'])

      if user&.authenticate(sign_in_params['password'])
        serialized_info = UserSerializer.new(user).as_json
        session[:user_id] = user.id

        set_current_user
        render json: serialized_info, status: :created
      else
        render json: { error: 'Email or password is invalid' }, status: :unprocessable_entity
      end
    end

    def logout
      reset_session
      render json: { logged_out: true }, status: :ok
    end

    def logged_in
      if @current_user
        render json: { logged_in: true, details: @current_user.as_json }
      else
        render json: { logged_in: false }, status: :no_content
      end
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end
  end
end
