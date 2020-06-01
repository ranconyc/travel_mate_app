class ActivityChannel < ApplicationCable::Channel

  def subscribed
    activity = Activity.find(params[:id])
    stream_for activity
  end

end
