json.data do
  json.array! @posts do |post|
    json.id post.id
    json.url post.url
    json.description post.description
    json.likes_count post.likes_count
    json.dislikes_count post.dislikes_count
  end
end
