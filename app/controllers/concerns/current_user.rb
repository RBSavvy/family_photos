module CurrentUser
  extend ActiveSupport::Concern
  USER_SESSION_KEY = :user_id
  included do
    helper_method :current_user
  end

  private

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find(session[USER_SESSION_KEY]) rescue nil
  end

  def login user
    if user.present? && user.respond_to?(:id)
      session[USER_SESSION_KEY] = user.id
      @current_user = user
      true
    else
      false
    end
  end

  def logout
    reset_session
  end

  def require_user
    unless current_user.present?

      flash[:warning] = "You must be logged in to access this page"
      redirect_to login_path
      false
    end
  end

end
