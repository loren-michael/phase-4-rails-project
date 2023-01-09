class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_resp
  before_action :authorize

  private

    def authorize
      @current_user = User.find_by(id: session[:user_id])
      if @current_user
        render json: @current_user
      else
        render json: { errors: ["User not authorized"] }, status: :unauthorized
      end
    end

    def render_unprocessable_entity_resp
      render json: { errors: [exception.record.errors.full_messages] }, status: :unprocessable_entity
    end
end
