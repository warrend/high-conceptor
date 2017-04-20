require 'faker'

FactoryGirl.define do
  factory :rating do
    logline_id { Faker::Number.between(1, 50) }
    user_id { Faker::Number.between(1, 20) }
    rating { Faker::Number.between(1, 100) }
  end
end
