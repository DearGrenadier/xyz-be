# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate!, except: %i[index show]

  def index
    posts = scope.where(filter_params).order(created_at: :desc)

    render json: posts, status: :ok
  end

  def create
    post = Post.create post_params

    if post.persisted?
      render json: post, status: :created
    else
      render json: post.errors.to_json, status: :unpocessable_untity
    end
  end

  def show
    render json: Post.find(params[:id]), status: :ok
  end

  def update
    post = scope.find(params[:id])

    if post.update(post_params)
      render json: post, status: :ok
    else
      render json: post.errors.to_json, status: :unpocessable_untity
    end
  end

  def destroy
    if Post.delete(params[:id]).zero?
      head :unpocessable_untity
    else
      head :ok
    end
  end

  private

  def post_params
    params.permit(:id, :body, :title, :status)
  end

  def filter_params
    params.permit(:status)
  end

  def scope
    current_user.present? ? Post.all : Post.published
  end
end
