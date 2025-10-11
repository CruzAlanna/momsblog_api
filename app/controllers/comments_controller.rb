class CommentsController < ApplicationController
  before_action :authorize_request, except: [ :index, :show ]

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
      time: set_date,
      author: set_author,
      content: params[:content],
      post_id: params[:post_id],
      user_id: current_user.id
    )
    if comment.save
      render json: comment, status: :created
    else 
      render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    comment = Comment.find(params[:id])

    authorize comment

    if comment.update(
      time: set_date,
      content: params[:content] || comment.content
    )
      render json: comment
    else
      render json: {errors: comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id])

    authorize comment
    
    comment.destroy
    render json: { message: 'Comment removed from Post' }, status: :ok
  end
end
