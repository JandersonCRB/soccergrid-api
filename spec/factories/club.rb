FactoryBot.define do
  factory :club do
    name { Faker::Team.name }
    club_key { Faker::Alphanumeric.alphanumeric(number: 10) }
  end
end