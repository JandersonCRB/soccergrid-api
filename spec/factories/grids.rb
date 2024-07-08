FactoryBot.define do
  factory :grid do
    active_on { Date.today }
    grid_number { 1 }
    grid_rows { 1 }
    grid_columns { 1 }
  end
end
