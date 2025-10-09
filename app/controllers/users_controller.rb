class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      username: params[:username],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: user, status: :created
    else 
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(
      first_name: params[:first_name] || user.first_name,
      last_name: params[:last_name] || user.last_name,
      username: params[:username] || user.username,
      password: params[:password] || user.password,
      password_confirmation: params[:password_confirmation] || user.password_confirmation,
    )
      render json: user
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { message: 'User successfully deleted' }, status: :ok
  end
end
