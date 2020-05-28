class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @activities = Activity.all
    @activities_limit = Activity.order('created_at desc').limit(4)
  end
end
