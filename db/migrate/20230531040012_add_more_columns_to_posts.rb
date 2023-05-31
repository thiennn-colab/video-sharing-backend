class AddMoreColumnsToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :text, null: false, after: :user_id
    add_column :posts, :video_id, :text, null: false, after: :url
  end
end
