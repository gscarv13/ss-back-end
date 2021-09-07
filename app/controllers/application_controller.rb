class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def check_session
    render json: { error: 'User not authorized' }, status: :unauthorized if @current_user.nil?
  end
end
