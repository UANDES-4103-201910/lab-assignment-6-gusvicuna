class RegistrationsController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Success"
      redirect_to log_in_path
    else
      flash[:notice] = "Error"
      redirect_to sign_in_path
    end
  end

  def user_params
    params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
  end
end
