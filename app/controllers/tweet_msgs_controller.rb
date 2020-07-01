class TweetMsgsController < ApplicationController
  before_action :set_tweet_msg, only: [:show, :update, :destroy]

  # GET /tweet_msgs
  def index
    @tweet_msgs = TweetMsg.all

    render json: @tweet_msgs
  end

  # GET /tweet_msgs/1
  def show
    render json: @tweet_msg
  end

  # POST /tweet_msgs
  def create
    @tweet_msg = TweetMsg.new(tweet_msg_params)

    if @tweet_msg.save
      render json: @tweet_msg, status: :created, location: @tweet_msg
    else
      render json: @tweet_msg.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweet_msgs/1
  def update
    if @tweet_msg.update(tweet_msg_params)
      render json: @tweet_msg
    else
      render json: @tweet_msg.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tweet_msgs/1
  def destroy
    @tweet_msg.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet_msg
      @tweet_msg = TweetMsg.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tweet_msg_params
      params.require(:tweet_msg).permit(:message, :references)
    end
end
