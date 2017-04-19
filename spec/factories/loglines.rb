require 'faker'

FactoryGirl.define do
  factory :logline do
    content { Faker::StarWars.quote}
  end
end
