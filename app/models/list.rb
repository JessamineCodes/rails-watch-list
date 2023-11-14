class List < ApplicationRecord
  has_one_attached :photo
  # list has many bookmarks and those bookmarks will be destroyed if the list is destroyed
  has_many :bookmarks, dependent: :destroy
  # below allows us to do list.movie
  has_many :movies, through: :bookmarks
  validates :name, presence: true, uniqueness: true
end
