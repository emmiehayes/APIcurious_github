FactoryBot.define do
  factory :user do
    username { Faker::StarWars.character }
    email { Faker::Internet.email }
    uid {Faker::Number.number(10)}
    provider { "GitHub" }
    oauth_token { ENV["test_token"] }
    created_at { Faker::Time.between(4.days.ago, Time.now, :all) }
    updated_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
