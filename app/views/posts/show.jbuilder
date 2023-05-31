json.data do
  json.id @post.id
  json.title @post.title
  json.video_id @post.video_id
  json.description @post.description
  json.liked @liked
  json.likes_count @post.likes_count
  json.dislikes_count @post.dislikes_count
  json.disliked @disliked
  json.created_by @post.user.email
  json.created_at @post.created_at.to_s
end
