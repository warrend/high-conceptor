class RatingSerializer < ActiveModel::Serializer
  attributes :id, :logline_id, :user_id, :rating 

  belongs_to :logline
  belongs_to :user 
end
