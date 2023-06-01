FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6) }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
