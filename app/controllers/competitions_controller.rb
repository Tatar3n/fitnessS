class CompetitionsController < ApplicationController
  def participate
    Competition.find_by_id(params[:competition_id])
               .competitions_users.create(user_id: current_user.id, role: 1)
  end
  def judge
    Competition.find_by_id(params[:competition_id])
               .competitions_users.create(user_id: current_user.id, role: 2)
  end
  def new
    @competition = Competition.new
  end
  def create
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
