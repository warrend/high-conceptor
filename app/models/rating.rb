class Rating < ApplicationRecord
  belongs_to :logline
  belongs_to :user
end
