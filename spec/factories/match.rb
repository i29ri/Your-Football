FactoryBot.define do
  factory :match do
    id { Faker::Number.number(digits:2) }
    created_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
    updated_at { Faker::Date.between(from: '2021-01-01', to: '2021-02-25')}
  end
end