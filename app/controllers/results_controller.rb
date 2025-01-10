class ResultsController < ApplicationController
  before_action :set_competition, only: [ :new, :create ]
  before_action :set_result, only: [ :edit, :update ]

  def new
    @competition = Competition.find(params[:competition_id])
    @result = @competition.results.new
    @athletes = @competition.users.where(competitions_users: { role: 1 }).distinct
  end

  def create
    @result = @competition.results.new(result_params)
    @result.referee = current_user

    if @result.score >= 0 && @result.save
      redirect_to competition_path(@competition), notice: "Результат успешно добавлен."
    else
      @athletes = @competition.users.where(competitions_users: { role: 1 })
      flash[:bad_notice] = "Результат не может быть отрицательным"
      render :new
    end
  end

  def edit
  end

  def update
    if @result.update(result_params)
      redirect_to competition_path(@result.competition), notice: "Результат успешно обновлен."
    else
      render :edit
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def set_result
    @result = Result.find(params[:id])
  end

  def result_params
    params.require(:result).permit(:athlete_id, :score)
  end
end
