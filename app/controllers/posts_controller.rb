class PostsController < BaseController
  skip_before_action :authorize_access_request!, :authenticate_user!, only: [:index, :show]

  def index
    @posts = Post.all.includes(:user)
    user = User.find_by(email: params[:email])
    @likes = user.present? ? Like.where(post_id: @posts.pluck(:id), user_id: user.id).pluck(:post_id) : []
    @dislikes = user.present? ? Dislike.where(post_id: @posts.pluck(:id), user_id: user.id).pluck(:post_id) : []
  end

  def create
    current_user.posts.create!(
      title: params[:title],
      url: params[:url],
      video_id: YoutubeUrlService.parse_id(url: params[:url]),
      description: params[:description]
    )

    head :ok
  end

  def show
    @post = Post.find(params[:id])
    user = User.find_by(email: params[:email])
    @liked = user.present? ? Like.find_by(post: @post, user_id: user.id).present? : false
    @disliked = user.present? ? Dislike.find_by(post_id: @post, user_id: user.id).present? : false
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
