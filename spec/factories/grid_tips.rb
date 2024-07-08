FactoryBot.define do
  factory :grid_tip do
    grid { nil }
    i { 1 }
    j { 1 }
    description { Faker::Lorem.sentence }
  end
end
