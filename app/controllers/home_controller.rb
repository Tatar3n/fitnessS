class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = User.find(session[:current_user_id])
  end
end
