class Posts::DislikesController < BaseController
  def create
    post = current_user.posts.find(params[:post_id])
    like = post.likes.find_by(user: current_user)

    Like.transaction do
      post.dislikes.create!(user: current_user)
      like.destroy! if like.present?
    end

    head :ok
  end

  def destroy
    like = current_user.posts.find(params[:post_id]).dislikes.find_by!(user: current_user).destroy!

    head :ok
  end
end
