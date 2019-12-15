class TweetSerializer < ActiveModel::Serializer
  attributes :id, :body
  belongs_to :user, serializer: UserSerializer
end
