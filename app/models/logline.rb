class Logline < ApplicationRecord
  belongs_to :user
  has_many :ratings
  has_many :logline_categories
  has_many :categories, through: :logline_categories

  validates :content, presence: true
  validates :content, length: { in: 3..225 }
end
