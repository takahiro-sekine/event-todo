class TasksController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = current_user.tasks
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = current_user.tasks.new task_params
    @task.save!
    redirect_to @task
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to @task
  end

  def destroy
    @task.destroy
    redirect_to tasks_url
  end

  private

  def target_task(task_id)
    current_user.tasks.where(id: task_id).take
  end

  def task_params
    params.require(:task).permit(:task_title, :task_body)
  end

  def set_item
    @task = target_task params[:id]
  end
end
