class UsersController < ApplicationController
  before_action :authorize, only: [:show]

  def create
      user = User.create(user_params)
      if user.valid?
          # Save user id in the session's hash
          session[:user_id] = user.id
          render json: user, only: [:id, :username, :image_url, :bio], status: :created
      else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def show
      user = User.find(session[:user_id])
      render json: user, only: [:id, :username, :image_url, :bio], status: :created
  end

  private

  def user_params
      params.permit(:username, :password, :password_confirmation, :image_url, :bio)
  end

  def authorize
      return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
  end

end
