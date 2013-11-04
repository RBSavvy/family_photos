class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  # login page
  def new
    @login_form = LoginForm.new
  end

  # login form POST
  def create
    @login_form = LoginForm.new(login_params)
    user = @login_form.authenticate
    if @login_form.valid? && login(user)
      redirect_to root_path
      flash[:success] = 'Logged in successfully'
    else
      render action: 'new'
    end
  end

  def destroy
    reset_session
    flash[:danger] = 'You have been logged out.'
    redirect_to root_path
  end

  private
  def login_params
    params.require(:login_form).permit(:email, :password)
  end

end