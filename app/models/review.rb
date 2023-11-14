class Review < ApplicationRecord
  belongs_to :list
  validates :rating, presence: true, numericality: { in: 0..5 }
  validates :content, presence: true
end
