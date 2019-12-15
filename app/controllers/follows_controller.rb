class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_follow

  def follow
    if @follow
      render json: { error: "Already Following" } and return
    end
    @follow = current_user.follows.create(followed_user_id: params[:followed_user_id])

    render json: {message: "User Followed Successfully"}
  end

  def unfollow
    unless @follow
      render json: { error: "You are not following this user" } and return
    end
    if @follow.destroy
      render json: {message: "User Unfollowed Successfully"}
    else
      render json: { error: @follow.errors.full_messages }
    end
  end

  private

  def set_follow
    @follow = current_user.follows.find_by(followed_user_id: params[:followed_user_id])
  end
end
