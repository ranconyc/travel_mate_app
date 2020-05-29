class ActivitiesController < ApplicationController
  def index
    @activities = Activity.all
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.price == nil
      @activity.price = 0
    end
    @activity.user = current_user
    if @activity.save
      redirect_to activity_path(@activity), notice: 'Activity was successfully created.'
    else
      render :new
    end
  end

  private

  def activity_params
    params.require(:activity).permit(:title, :date, :description, :category, :vibe, :group_size, :location, :ideal_member, :price)
  end
end
