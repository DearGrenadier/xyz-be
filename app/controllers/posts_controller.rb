class PostsController < ApplicationController
  def create
    post = Post.create post_params

    if post.persisted?
      render json: post.to_json, status: :created
    else
      render json: post.errors.to_json, status: :unpocessable_untity
    end
  end

  def show
    render json: Post.find(params[:id]).to_json
  end

  private

  def post_params
    params.permit(:body)
  end
end