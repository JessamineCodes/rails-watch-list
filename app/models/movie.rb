class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  # the foreign key relationship prevents movies being destroyed if they have any foreign keys (ie bookmakrs) dependent on them
  # if we specified dependent:destroy on line 2 then this would destroy all the related bookmarks if the movie was destroyed
  # but without this line, rails will automatically raise an error if we tried to destroy a movie that had bookmarks because of the foreign key relationship
end
