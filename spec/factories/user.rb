FactoryBot.define do
  factory :user do
    id { Faker::Number.number(digits:2) }
    yourfoot_ID { Faker::Food.fruits }
    nickname { Faker::Name.name }
    email { Faker::Internet.email('rspec') }
    encrypted_password { Faker::Number.number(digits:10) }
    created_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
    updated_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
  end
end