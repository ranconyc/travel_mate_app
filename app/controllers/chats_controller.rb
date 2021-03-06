class ChatsController < ApplicationController
  def index
    @my_activities = current_user.activities.order(:title)
    @my_joined_activities = getJoinedActivities
    @activities = @my_activities + @my_joined_activities
    @my_accepted_activities = getAcceptedActivities
    @chat_activities = @my_activities + @my_accepted_activities

  end

  def show
    @activity = Activity.find(params[:id])
    @message = Message.new
  end

  private

  def getJoinedActivities
    my_joined_activities_arr = []
    members_arr = Member.where(user_id: current_user.id)
    members_arr.each do |member|
      my_joined_activities_arr << Activity.find(member.activity_id)
    end
    my_joined_activities_arr
  end

  def getAcceptedActivities
    my_accepted_activities_arr = []
    members_arr = Member.where(user_id: current_user.id)
    members_arr.each do |member|
      if member.status == "accept"
        my_accepted_activities_arr << Activity.find(member.activity_id)
      end
    end
    my_accepted_activities_arr
  end
end

