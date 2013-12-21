class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update_attributes user_params
    flash[:success] = 'Successfully updated account.'
    redirect_to account_path
  end

  def user_params
    params.require(:user).permit(:name, :address, :city, :state, :zip_code, :email, :phone, :password, :password_confirmation)
  end
end
