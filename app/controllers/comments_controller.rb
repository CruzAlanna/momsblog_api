class CommentsController < ApplicationController
  def index
    comments = Comment.all
    render json: comments
  end
  
  def show
    comment = Comment.find(params[:id])
    render json: comment
  end

  def create
    comment = Comment.new(
      time: params[:time],
      author: params[:author],
      content: params[:content],
      post_id: params[:post_id],
      user_id: params[:user_id]
    )
    if comment.save
      render json: comment, status: :created
    else 
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])
    if comment.update(
      time: params[:time] || comment.time,
      author: params[:author] || comment.author,
      content: params[:content] || comment.content
    )
      render json: comment
    else
      render json: {errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    render json: { message: 'Comment removed from Post' }, status: :ok
  end
end
