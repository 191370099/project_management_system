class TasksController < ApplicationController

  def new
  end
  def create
    @task = Task.new(name: params[:name],description: params[:description],task_type: params[:task_type],task_status: params[:task_status], task_status: "assigned" ,priority: params[:priority], project_id: params[:project_id], developer_id: params[:developer_id]) 
    if @task.save
      redirect_to root_path
      flash[:notice] = "Task Created Successfully!"
    end
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    @task = Task.find(params[:id])
    @task.name = params[:task][:name]
    @task.description = params[:task][:description]
    @task.task_type = params[:task][:task_type]
    @task.task_status = params[:task][:task_status]
    @task.priority = params[:task][:priority]
    if @task.save
      redirect_to root_path
      flash[:notice] = "Task updated"
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
    flash[:notice] = "Task deleted"
  end
end
