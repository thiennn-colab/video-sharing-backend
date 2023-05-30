class CreatePostLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :post_likes do |t|
      t.belongs_to :post
      t.bigint :user_id, null: false
      t.timestamps
    end
  end
end
