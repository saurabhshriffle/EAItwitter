class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :tweets, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followings, through: :follows, source: :followed_user

  def followers
    Follow.where(followed_user_id: id).map(&:user)
  end
end
