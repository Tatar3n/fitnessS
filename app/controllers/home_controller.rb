class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(session[:current_user_id])
    @upcoming_events = Event.upcoming_events
  end
end
