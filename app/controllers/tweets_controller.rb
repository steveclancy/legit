class TweetsController < ApplicationController
  def update_status
    tweet = Tweet.find(params[:id])
    tweet.update(:status_id => params[:status_id])
    render :nothing => true
  end
end
