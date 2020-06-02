class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    unless user_signed_in?
      @activities_limit = Activity.order('created_at desc').limit(4)
      return
    end

    @cat = nil
    if params[:query].present?
      @activities = Activity.global_search(params[:query])
    elsif params.include? :cat
      # do the search , store values in @activities
      @activities = Activity.search_by_category(params[:cat])
      @cat = params[:cat]
    else
      @activities = Activity.all
    end

    @cur_location = get_current_location
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
      member.save!
    elsif status == "decline"
      member.status = "reject"
      Member.destroy(member.id)
    end
  end

  def get_current_location
    if params[:lat] && params[:lon]
      @activities = Activity.near([params[:lat], params[:lon]], 15)
      @mid_cur_location = Geocoder.search([params[:lat], params[:lon]]).first.data["address"]
      if @mid_cur_location["city"]
        return @mid_cur_location["city"]
      else
        return @mid_cur_location["municipality"]
      end
    else
      if user_signed_in?
        return current_user.location.split(',').first
      else
        return nil
      end
    end
  end
end
