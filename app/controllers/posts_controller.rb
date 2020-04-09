# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    posts = Post.all

    render json: posts, status: :ok
  end

  def create
    post = Post.create post_params

    render json: post, status: :created if post.persisted?

    render json: post.errors.to_json, status: :unpocessable_untity
  end

  def show
    render json: Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])

    render json: post, status: :ok if post.update(post_params)

    render json: post.errors.to_json, status: :unpocessable_untity
  end

  def destroy
    render status: :ok if Post.delete(params[:id]).zero?

    render status: :unpocessable_untity
  end

  private

  def post_params
    params.permit(:body, :title)
  end
end
