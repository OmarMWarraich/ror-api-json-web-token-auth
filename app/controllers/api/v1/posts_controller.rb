class Api::V1::PostsController < ApiController
  before_action :set_post, only: [:show]

  def show
    render json: @post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
