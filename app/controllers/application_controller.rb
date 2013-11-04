class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CurrentUser
  include ActiveActions

  before_action :require_user

end
