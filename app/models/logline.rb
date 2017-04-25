class Logline < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :logline_categories
  has_many :categories, through: :logline_categories
  has_many :users, through: :ratings

  validates :content, presence: true
  validates :content, length: { in: 3..225 }

  def categories_attributes=(category_attributes)
    if self.save  
      split_categories(category_attributes).each do |category_attribute|
        category = Category.find_or_create_by(name: category_attribute)
        self.categories << category
      end
    end
  end

  scope :highest_rated, -> { where('average_rating > ?', 0) }
  # order(average_rating: :desc)

  def split_categories(hash)
  	c = hash.flatten
  	c = c.last
  	cat = c.values
  	cats_array = cat.first.split
  end

  def to_date
  	self.created_at.strftime("%b %e, %l:%M %p") 
  end

end
