class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to log_in_path, notice: 'User was successfully created.' }
      else
        format.html { redirect_to sign_in_path, notice: 'Error'}
      end
    end
  end

  def user_params
    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
  end
end
