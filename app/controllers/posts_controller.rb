class PostsController < ApplicationController
  before_action :authorize_request, except: [ :index, :show ]

  def index
    posts = Post.all
    render json: posts
  end
  
  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(
      title: params[:title],
      author: set_author,
      date: set_date,
      content: params[:content],
      user_id: current_user.id
    )
    if post.save
      render json: post, status: :created
    else 
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])

    authorize post

    if post.update(
      title: params[:title] || post.title,
      date: set_date,
      content: params[:content] || post.content
    )
      render json: post
    else
      render json: {errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])

    authorize post
    
    post.destroy
    render json: { message: 'Post removed' }, status: :ok
  end
end
