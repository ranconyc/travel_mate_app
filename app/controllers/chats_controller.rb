class ChatsController < ApplicationController
  def index
    @activities = current_user.activities.order(:title)
  end

  def show
    @activity = Activity.find(params[:id])
    @message = Message.new
  end
end
