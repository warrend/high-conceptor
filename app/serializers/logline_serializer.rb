class LoglineSerializer < ActiveModel::Serializer
  attributes :id, :content, :average_rating, :created_at, :ratings

  belongs_to :user
  has_many :categories
end
