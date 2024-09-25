class ProjectsController < ApplicationController
  def index
    if params[:q]
      @projects = Project.search_by_name_or_customer(params[:q])
    else
      @projects = Project.all
    end
  end
end
