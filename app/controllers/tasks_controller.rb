class TasksController < ApplicationController

  def new
  end
  def create
    @task = Task.new(name: params[:name],description: params[:description],task_type: params[:task_type],task_status: params[:task_status],priority: params[:priority], manager_id: current_user.id) 
    if @task.save
      redirect_to root_path
    end
  end
  def edit
    @task = Task.find(params[:id])
  end
end
