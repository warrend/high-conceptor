class LoglineSerializer < ActiveModel::Serializer
  attributes :id, :content, :average_rating

  belongs_to :user
  has_many :categories
end
