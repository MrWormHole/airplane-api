# spec/factories/airplanes.rb
FactoryBot.define do
  factory :airplane do
    name { Faker::Lorem.word }
    specificID { Faker::Number.number(5
    ) }
  end
end
