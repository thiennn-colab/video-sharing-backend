FactoryBot.define do
  factory :like do
    association :post
    association :user
    created_at { Time.current }
    updated_at { Time.current }
  end
end
