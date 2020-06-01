class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    unless user_signed_in?
      @activities_limit = Activity.order('created_at desc').limit(4)
      return
    end

    if params.include? :cat
      # do the search , store values in @activities
      @activities = Activity.search_by_category(params[:cat])
      @cat = params[:cat]
    else
      @activities = Activity.all
      @cat = nil
    end
  end

  def dashboard
    @my_activities = Activity.where(user: current_user)
    @my_requests = getPendingRequests
    @query = params[:query]
    @status = params[:status]
    @member = Member.find(params[:member]) if params[:member]
    @activity = params[:activity]
    @query = 'requests' unless @query
    if @status
      changeRequestStatus(@status, @member, @activity)
      redirect_to dashboard_path
    end
  end

  private

  def getPendingRequests
    my_members_arr = []
    @my_activities = Activity.where(user: current_user)
    @my_activities.each do |activity|
      my_members_arr += activity.members
    end
    my_members_arr.delete_if { |member| member.status == "accept" || member.status == "reject"}
    my_members_arr
  end

  def changeRequestStatus(status, member, activity)
    if status == "accept"
      member.status = "accept"
    elsif status == "decline"
      member.status = "reject"
      Member.destroy(member.id)
    end
    member.save!
  end
end
