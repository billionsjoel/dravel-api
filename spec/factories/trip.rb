FactoryBot.define do
  factory :trip do
    name { Faker::Lorem.word }
  end
end
