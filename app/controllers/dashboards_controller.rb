class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @projects = @user.projects
  end
end
