class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # below validates that it's a unique combo
  validates_uniqueness_of :movie_id, scope: :list_id
end
