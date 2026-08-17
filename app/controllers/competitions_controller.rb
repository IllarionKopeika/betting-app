class CompetitionsController < ApplicationController
  def index
    @active_competitions = Competition.where(status: [ :ongoing, :locked ])
    @completed_competitions = Competition.where(status: :completed)
  end
  def new
    @competition = Competition.new
  end

  def create
    @competition = Competition.new(competition_params)
    if @competition.save
      flash[:success] = "Бет создан!"
      redirect_to root_path
    else
      render "new", status: :unprocessable_entity
    end
  end

  private

  def competition_params
    params.require(:competition).permit(:name, :prediction_deadline, team_ids: [])
  end
end
