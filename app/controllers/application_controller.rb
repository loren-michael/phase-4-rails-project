class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_resp
  before_action :authorize


  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user = User.find_by_id(session[:user_id]) if logged_in?
  end

  private

    def authorize
      @current_user = User.find_by(id: session[:user_id])
      render json: { errors: ["User not authorized"] }, status: :unauthorized unless @current_user
    end

    def render_unprocessable_entity_resp(exception)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
