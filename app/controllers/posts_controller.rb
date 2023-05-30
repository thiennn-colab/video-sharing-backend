class PostsController < BaseController
  skip_before_action :authorize_access_request!, :authenticate_user!, only: [:index]

  def index
    @posts = Post.all
  end

  def create
    current_user.posts.create!(
      url: params[:url],
      description: params[:desctiption]
    )

    head :ok
  end

  def update
    current_user.posts.find(params[:id]).update!(
      url: params[:url],
      description: params[:desctiption]
    )

    head :ok
  end

  def destroy
    post = current_user.posts.find(params[:id])

    Post.transaction do
      post.likes.destroy_all
      post.dislikes.destroy_all
      post.destroy!
    end

    head :ok
  end
end
