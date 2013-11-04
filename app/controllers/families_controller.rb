class FamiliesController < ApplicationController

  def index
    redirect_to family_path(current_user.families.first)
  end

  def show
    set_active_action :members
  end

  private
  def current_families
    @current_families ||= current_user.families
  end
  helper_method :current_families

  def current_family
    @current_family ||= current_user.families.find(params[:id])
  end
end
