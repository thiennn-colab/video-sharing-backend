class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.index :id
      t.belongs_to :user
      t.text :url
      t.text :description
      t.integer :likes_count, default: 0
      t.integer :dislikes_count, default: 0
      t.timestamps
    end
  end
end
