class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    @project_form = ProjectForm.new(project_params)
    if @project_form.save
      redirect_to root_path
    else
      flash[:danger] = @project_form.errors.full_messages.join('. ')
      redirect_to new_project_path
    end
  end

  def edit
    find_project
  end

  def update
    # TODO: update
  end

  private

  def project_params
    params
      .require(:project)
      .permit(:title, :description)
      .merge(user_id: current_user.id, pictures: params[:pictures])
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
