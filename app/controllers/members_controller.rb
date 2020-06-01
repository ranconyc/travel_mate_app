class MembersController < ApplicationController
  def create
    @activity = Activity.find(params[:activity_id])
    if  @activity.members.where(status: "accept").count >= @activity.group_size
      redirect_to activity_path(@activity), notice: 'this activity is full'
    else
      @member = Member.new
      @member.user = current_user
      @member.activity = @activity
      if @member.save
        redirect_to activity_path(@activity), notice: 'Your request has been sent.'
      else
        render 'activities/show'
      end
    end
  end

  def destroy
    @member = Member.find(params[:id])
    activity = @member.activity
    @member.destroy
    redirect_to activity_path(activity), notice: 'You have left the activity'
  end
end
