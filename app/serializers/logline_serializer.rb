class LoglineSerializer < ActiveModel::Serializer
  attributes :id, :content, :average_rating

  belongs_to :user
end
