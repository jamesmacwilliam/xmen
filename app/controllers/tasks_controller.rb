class TasksController < ApplicationController
  belongs_to :team

  def update
    update!
  end

  private

  def task_params
    params.require(:task).permit(:name, :desc, :completed, :team_id)
  end
end
