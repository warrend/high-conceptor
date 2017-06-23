class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :ratings

  has_many :loglines
  has_many :ratings
end
