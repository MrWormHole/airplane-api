# spec/factories/humen.rb
FactoryBot.define do
  factory :item do
    name { Faker::StarWars.character }
    airplane_id nil
  end
end