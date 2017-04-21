class Logline < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :logline_categories
  has_many :categories, through: :logline_categories
  has_many :users, through: :ratings

  validates :content, presence: true
  validates :content, length: { in: 3..225 }

  def categories_attributes=(category_attributes)
    split_categories(category_attributes).each do |category_attribute|
      category = Category.find_or_create_by(name: category_attribute)
      self.categories << category
    end
  end

  def split_categories(hash)
  	c = hash.flatten
  	c = c.last
  	cat = c.values
  	cats_array = cat.first.split
  end

  def to_date
  	self.created_at.strftime("%b %e, %l:%M %p") 
  end

  def total_ratings
    self.ratings.count 
  end

  def average_rating
    if total_ratings > 0
      self.ratings.inject(0) { |sum, rating| sum + rating.rating } / total_ratings
    else
      "No ratings yet."
    end
  end

end
