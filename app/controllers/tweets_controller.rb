class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.where(user_id: current_user.followings.ids).order(created_at: "#{params[:order_by] || 'ASC'}")
    render json: @tweets, each_serializer: TweetSerializer
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      render json: @tweet, serializer: TweetSerializer
    else
      render json: { error: @tweet.errors.full_messages }
    end
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
