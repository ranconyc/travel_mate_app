class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :destroy, :edit, :update]

  def index
    @activities = Activity.all
  end

  def show
    @member = Member.find_by(activity: @activity, user: current_user)
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.price.nil?
      @activity.price = 0
    end
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity), notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @activity.update(activity_params)
    redirect_to activity_path(@activity)
  end

  def destroy
    @activity.destroy
    redirect_to root_path
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def activity_params
    params.require(:activity).permit(:title, :date, :description, :category, :vibe, :group_size, :location, :ideal_member, :price)
  end
end
