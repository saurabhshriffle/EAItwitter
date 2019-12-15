class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :followers
  has_many :followings
end
