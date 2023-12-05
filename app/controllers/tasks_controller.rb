class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def new
    @task = Task.new
  end

  def create
    @project = Project.find(params[:project_id])
    @task = @project.tasks.new(task_params)
    return unless @task.save

    redirect_to root_path
    flash[:notice] = 'Task Created Successfully!'
  end

  def edit; end

  def update
    return unless @task.update(task_params)

    respond_to do |format|
      format.json do
        render json: { success: true }
      end
      format.html { redirect_to root_path }
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
    flash[:notice] = 'Task deleted'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :task_type, :task_status, :priority, :developer_id)
  end
end
