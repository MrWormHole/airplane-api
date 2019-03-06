# spec/factories/humen.rb
FactoryBot.define do
  factory :human do
    name {  Faker::Movies::StarWars.character }
    airplane_id nil
  end
end