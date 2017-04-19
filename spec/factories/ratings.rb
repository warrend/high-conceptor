require 'faker'

FactoryGirl.define do
  factory :rating do
    logline nil
    user nil
    rating { Faker::Number.between(1, 100) }
  end
end
