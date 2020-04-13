# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    posts = Post.all.order(created_at: :desc)

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
    render json: Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

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
end
