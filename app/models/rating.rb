class Rating < ApplicationRecord
  belongs_to :logline
  belongs_to :user

  validates :rating, numericality: { greater_than: 0, less_than: 101 }

  scope :recent_ratings, -> (limit) { order("created_at desc").limit(limit) }

end
