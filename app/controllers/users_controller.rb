class UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # def create
  #   user = User.create!(user_params)
  #   session[:user_id] = user.id
  #   render json: user, status: :created
  # end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      render json: @user, status: 201
    else
      render json: { errors: @user.errors.full_messages }, status: 422
    end
  end


  def show
    render json: @current_user
  end

  private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
