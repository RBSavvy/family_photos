class FamiliesController < ApplicationController

  def index
    redirect_to family_path(current_user.families.first)
  end

  def show
    set_active_action :members
  end

  def create
    family = current_user.families.create(family_params)
    redirect_to family
  end

  def edit
    set_active_action :manage
  end

  def update
    current_family.update_attributes(family_params)
    redirect_to current_family
  end

  def destroy
    current_family.destroy
    redirect_to families_path
  end

  def leave
    current_user.family_users.where(family_id: params[:id]).destroy_all
    redirect_to families_path
  end

  private
  def family_params
    params.require(:family).permit(:name)
  end

  def current_families
    @current_families ||= current_user.families
  end
  helper_method :current_families

  def current_family
    @current_family ||= current_user.families.find(params[:id])
  end
end
