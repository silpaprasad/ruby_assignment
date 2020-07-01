class UserTweetsController < ApplicationController
  before_action :set_user_tweet, only: [:show, :update, :destroy]

  # GET /user_tweets
  def index
    @user_tweets = UserTweet.all

    render json: @user_tweets
  end

  # GET /user_tweets/1
  def show
    render json: @user_tweet
  end

  # POST /user_tweets
  def create
    @user_tweet = UserTweet.new(user_tweet_params)

    if @user_tweet.save
      render json: @user_tweet, status: :created, location: @user_tweet
    else
      render json: @user_tweet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_tweets/1
  def update
    if @user_tweet.update(user_tweet_params)
      render json: @user_tweet
    else
      render json: @user_tweet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_tweets/1
  def destroy
    @user_tweet.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_tweet
      @user_tweet = UserTweet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_tweet_params
      params.require(:user_tweet).permit(:message, :references)
    end
end
