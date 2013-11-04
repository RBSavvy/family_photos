class FamiliesController < ApplicationController

  def index
    redirect_to family_path(current_user.families.first)
  end

  def show
    @family = current_families.select{|f| f.id == params[:id].to_i}.first
  end

  private
  def current_families
    @current_families ||= current_user.families
  end
  helper_method :current_families
end
