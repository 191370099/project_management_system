class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = if current_user.type == 'Manager'
                  current_user.projects
                else
                  Project.joins(:tasks).where('tasks.developer_id = ?', current_user.id).distinct
                end
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    return unless @project.save

    redirect_to root_path
  end

  def edit; end

  def update
    return unless @project.update(project_params)

    redirect_to root_path
    flash[:notice] = 'Project updated'
  end

  def destroy
    ActiveRecord::Base.transaction do
      @project.tasks.destroy_all
      @project.destroy
    end
    redirect_to root_path
  rescue StandardError => e
    flash[:alert] = 'An error occurred'
    redirect_to root_path
  end

  def show
    @tasks = Task.where('project_id = ?', @project.id)
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :due_date)
  end
end
