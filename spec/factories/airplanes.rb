# spec/factories/airplanes.rb
FactoryBot.define do
  factory :airplane do
    name { Faker::Lorem.word }
    flying_hours { Faker::Number.number(5) }
  end
end
