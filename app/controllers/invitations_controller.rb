class InvitationsController < ApplicationController
  skip_before_action :require_user

  def show
    if current_user.present?
      family = Family.find_by_invite_code(params[:invite_code])
      add_to_user(family)
    else
      @login_form = LoginForm.new invite_code: params[:invite_code]
      @signup_form = InviteSignupForm.new invite_code: params[:invite_code]
    end
  end

  def create
    if login_params.present?
      @login_form = LoginForm.new login_params
      @signup_form = InviteSignupForm.new invite_code: login_params[:invite_code]

      user = @login_form.authenticate
      family = Family.find_by_invite_code(@login_form.invite_code)
      if @login_form.valid? && login(user) && family.present?

        add_to_user family
      else
        render action: 'show'
      end

    else
      @login_form = LoginForm.new invite_code: signup_params[:invite_code]
      @signup_form = InviteSignupForm.new signup_params
      @signup_form.submit
      family = Family.find_by_invite_code(@signup_form.invite_code)
      if @signup_form.valid? && login(@signup_form.user) && family.present?
        add_to_user family
      else
        render action: 'show'
      end

    end
  end

  private
  def add_to_user family
    if family.present?
      unless current_user.families.map(&:id).include?(family.id)
        current_user.families << family
        flash[:success] = "Successfully joined the '#{family.name}' family."
      else
        flash[:warning] = "You are already in the '#{family.name}' family."
      end
    else
      flash[:danger] = 'Unable to add you to that family'
    end
    redirect_to families_path
  end

  def login_params
    params.require(:login_form).permit(:email, :password, :invite_code)
  rescue
    {}
  end

  def signup_params
    params.require(:invite_signup_form).permit(:name, :email, :password, :password_confirmation, :invite_code)
  rescue
    {}
  end

end