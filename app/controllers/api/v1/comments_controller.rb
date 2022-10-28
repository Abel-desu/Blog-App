class Api::V1::CommentsController < ApplicationController
  before_action :authorize_request
  before_action :find_user_post

  def new
    @comment = Comment.new
  end

  def index
    post = Post.find(params[:post_id])
    comments = post.comments

    if comments.size.positive?
      render json: comments, status: :ok
    else
      render json: { message: 'No comments found' }, status: :not_found
    end
  end

  def show
    @comment = Comment.find(params[:id])
    render json: @comment, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'Comment not found' }, status: :not_found
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(text: params[:text], author: current_user.id, post_id: @post.id)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { message: 'Comment not created' }, status: :unprocessable_entity
    end
  end

  private

  def find_user_post
    @user = User.find_by_id!(params[:user_id])
    @post = @user.posts.find_by_id!(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    render json: { message: 'User or Post not found' }, status: :not_found
  end
end
