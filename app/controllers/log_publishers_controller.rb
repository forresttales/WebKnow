class LogPublishersController < ApplicationController


  def create
    # @log_user = current_user.log_users.build(log_user_params)
    # if @log_user.save
    # else
      # @feed_items = []
    # end
  end

  
  def destroy
    # @log_user.destroy
  end


  private

    def log_publisher_params
      # params.require(:log_user).permit(:content)
    end


end
