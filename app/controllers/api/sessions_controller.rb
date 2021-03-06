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

    def destroy
      reset_session
      render json: { logged_out: true }, status: :ok
    end

    private

    def sign_in_params
      params.require(:user).permit(:email, :password)
    end
  end
end
