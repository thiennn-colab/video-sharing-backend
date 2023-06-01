FactoryBot.define do
  factory :post do
    association :user
    title { "Example Title" }
    url { "https://www.youtube.com/watch?v=mXIXfv7dbvI&ab_channel=KfirOchaion" }
    video_id { "mXIXfv7dbvI" }
    description { "Example description" }
    likes_count { 0 }
    dislikes_count { 0 }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
