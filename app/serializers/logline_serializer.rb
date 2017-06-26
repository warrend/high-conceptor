class LoglineSerializer < ActiveModel::Serializer
  attributes :id, :content, :average_rating, :created_at, :ratings, :user_id

  belongs_to :user
  has_many :categories
end
