json.data do
  json.array! @posts do |post|
    json.id post.hashid
    json.title post.title
    json.video_id post.video_id
    json.description post.description
    json.liked @likes.include?(post.id)
    json.likes_count post.likes_count
    json.disliked @dislikes.include?(post.id)
    json.dislikes_count post.dislikes_count
    json.created_by post.user.email
    json.created_at post.created_at.to_s
  end
end
