class TweetsController < ApplicationController
  def new
  	@todo = Todo.find_by(:id => params[:message])
  end

  def create
  	current_user.tweet(twitter_params[:message])
  end

  def twitter_params
  	params.require(:tweet).permit(:message)
  end
end
