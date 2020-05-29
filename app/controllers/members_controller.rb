class MembersController < ApplicationController
  def create
    @member = Member.new
    @member.user = current_user
    @activity = Activity.find(params[:activity_id])
    @member.activity = @activity
    @member.save!
    if @member.save
      redirect_to activity_path(@activity), notice: 'Member was successfully created.'
    else
      render 'activities/show'
    end
  end

  def destroy

  end
end
