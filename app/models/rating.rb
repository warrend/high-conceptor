class Rating < ApplicationRecord
  belongs_to :logline
  belongs_to :user

  validates :rating, numericality: { greater_than: 0, less_than: 101 }

  scope :recent_ratings, -> (limit) { order("created_at desc").limit(limit) }

  after_save :update_ratings_average

  def update_ratings_average
  	logline = self.logline
  	logline.average_rating = logline.ratings.inject(0) { |sum, rating| sum + rating.rating } / total_ratings
  	logline.save
  end

  def total_ratings
    logline = self.logline
    logline.ratings.count
  end

end
