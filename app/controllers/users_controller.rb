class UsersController < ApplicationController
  before_action :authorize_request, except: [ :create ]

  def index
    users = policy_scope(User)
    render json: users
  end

  def show
    user = User.find(params[:id])

    authorize user

    render json: user
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      role: params[:role]
    )
    if user.save
      user.update(username: "#{params[:last_name]}#{params[:first_name]}")
      render json: { message: 'User created successfully' }, status: :created
    else 
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    authorize user

    if user.update(
      first_name: params[:first_name] || user.first_name,
      last_name: params[:last_name] || user.last_name,
      email: params[:email] | user.email,
      password: params[:password] || user.password,
      password_confirmation: params[:password_confirmation] || user.password_confirmation
    )
      render json: user
    else
      render json: {errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])

    authorize user
    
    user.destroy
    render json: { message: 'User successfully deleted' }, status: :ok
  end
end
