class Grid < ApplicationRecord
  has_many :grid_tips, dependent: :destroy
  has_many :grid_answers, dependent: :destroy
end
