class RegistrationsController < ApplicationController
  def new
  end
  def create
    @user = Identification.register_user(
      email: safe_params[:email],
      name: safe_params[:name],
      password: safe_params[:password],
      password_confirmation: safe_params[:password_confirmation]
    )
    if @user
      sign_in_user(@user)
      redirect_to dashboard_url
    else
      render action: "new"
    end
  end

  private

  def safe_params
    params.require(:registration).permit(:email, :name, :password, :password_confirmation)
  end
end
