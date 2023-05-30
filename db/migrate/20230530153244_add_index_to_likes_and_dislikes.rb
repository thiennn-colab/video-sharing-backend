class AddIndexToLikesAndDislikes < ActiveRecord::Migration[7.0]
  def change
    add_index :post_likes, %i(user_id post_id), unique: true
    add_index :post_dislikes, %i(user_id post_id), unique: true
  end
end
