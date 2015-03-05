class TeamsController < ApplicationController

  private

  def team_params
    params.require(:team).permit(:name, :desc)
  end
end
