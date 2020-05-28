class MembersController < ApplicationController
  def create
    @member = Member.new(member_params)
    @member.user = current_user
    @activity = @member.activity
    if @member.save
      redirect_to activity_path(@activity), notice: 'Member was successfully created.'
    else
      render '/'
    end
  end

  private

  def member_params
    params.require(:member).permit(:activity)
  end
end
