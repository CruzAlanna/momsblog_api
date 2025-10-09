class PostsController < ApplicationController
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
      author: params[:author],
      date: params[:date],
      content: params[:content],
      user_id: params[:user_id]
    )
    if post.save
      render json: post, status: :created
    else 
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(
      title: params[:title] || post.title,
      author: params[:author] || post.author,
      content: params[:content] || post.content,
      user_id: params[:user_id] || post.user_id,
    )
      render json: post
    else
      render json: {errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render json: { message: 'Post removed' }, status: :ok
  end
end
