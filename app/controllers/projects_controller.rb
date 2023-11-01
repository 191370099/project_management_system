class ProjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.type == 'Manager'
      @projects = User.find_by_email(current_user.email).projects
    else
      @projects = Project.joins(:tasks).where("tasks.developer_id = ?",current_user.id).distinct
    end
  end
  def new
  end
  def create
    @project = Project.new(name: params[:name],description: params[:description],due_date: params[:due_date], manager_id: current_user.id) 
    if @project.save
      redirect_to root_path
    end
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    @project.due_date = params[:project][:due_date]
    if @project.save
      redirect_to root_path
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to root_path
  end
  def show
    @project = Project.find(params[:id])
    @tasks = Task.where("project_id = ?",@project.id)
  end
end
