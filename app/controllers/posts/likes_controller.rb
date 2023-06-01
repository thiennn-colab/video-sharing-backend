class Posts::LikesController < BaseController
  def create
    post = Post.find(params[:post_id])
    dislike = post.dislikes.find_by(user: current_user)

    Like.transaction do
      post.likes.create!(user: current_user)
      dislike.destroy! if dislike.present?
    end

    head :ok
  end

  def destroy
    Post.find(params[:post_id]).likes.find_by!(user: current_user).destroy!

    head :ok
  end
end
