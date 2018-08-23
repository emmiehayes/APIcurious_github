FactoryBot.define do
  factory :user do
    provider { "GitHub" }
    uid { Faker::Number.number(10) }
    username { Faker::Space.moon }
    name { Faker::StarWars.character }
    email { Faker::Internet.email }
    oauth_token { ENV["test_token"] }
    created_at { Faker::Time.between(4.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
