class Logline < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :logline_categories
  has_many :categories, through: :logline_categories

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

end
