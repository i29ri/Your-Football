FactoryBot.define do
  factory :review do
    association :user
    association :match
    id { Faker::Number.number(digits:2) }
    rating {Faker::Number.between(from: 1, to: 5)}
    comment { Faker::Food.fruits }
    created_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
    updated_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
  end
end
