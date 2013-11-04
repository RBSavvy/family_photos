class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CurrentUser
  include ActiveActions

  before_action :require_user


  def current_family
    @current_family ||= current_user.families.find(params[:family_id])
  end
  helper_method :current_family
end
