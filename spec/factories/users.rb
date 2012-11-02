# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:creator], class: User do
    name { Faker.name }
    email { Faker::Internet.email }
    password 'secret123'
    password_confirmation 'secret123'
    confirmed_at { Time.now }
  end
end
