class CompetitionsController < ApplicationController
  def participate
    @competition = Competition.find_by_id(params[:competition_id])

    if current_user.valid_for_competition?(@competition)
      @competition.competitions_users.create(user_id: current_user.id, role: 1)
      redirect_to @competition, notice: "Вы успешно записались на соревнование."
    else
      redirect_to @competition, alert: "Ваш вес не соответствует требованиям соревнования."
    end
  end
  def judge
    @competition = Competition.find_by_id(params[:competition_id])
    @competition.competitions_users.create(user_id: current_user.id, role: 2)
    redirect_to @competition, notice: "Теперь вы являетесь судьей"
  end
  def new
    @competition = Competition.new
  end

  def create
  end

  def edit
    @competition = Competition.find(params[:competition_id])
  end

  def update
    @competition = Competition.find(params[:id])
    if @competition.update(competition_params)
      redirect_to @competition, notice: "Соревнование успешно обновлено."
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :min_athlete_weight, :max_athlete_weight, :starts_at, :ends_at)
  end
end
