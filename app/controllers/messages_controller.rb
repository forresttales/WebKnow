class MessagesController < ApplicationController
  def index
  	if signed_in?
  		@messages = Message.all
  	else
  		redirect_to '/Signin'
  	end
  end

  def create
  	@message = Message.create!(params[:message])
  end
end
