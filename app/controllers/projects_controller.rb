class ProjectsController < ApplicationController
  def index
    @project = Project.new
    @projects = current_user.projects.all.page(params[:page]).per(5)
  end

  def create
    @project = current_user.projects.new(project_params)
    @projects = current_user.projects
    if @project.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @project = Project.find(params[:id])
    @notecards = Notecard.all.page(params[:page]).per(5)
  end

  private

  def project_params
    params.require(:project).permit(:title, :category, :completed)
  end
end
