class Category < ApplicationRecord
	has_many :logline_categories
	has_many :loglines, through: :logline_categories
end
