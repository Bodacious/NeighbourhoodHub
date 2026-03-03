class SessionsController < ApplicationController
  def new
  end

  def create
    user = Identification.authenticate_user(email: session_params[:email], password: session_params[:password])
    if user
      sign_in(user)
      redirect_to dashboard_url, notice: "Signed in"
    else
      flash.now[:error] = "Details not recognised"
      render :new
    end
  end

  def destroy
    sign_out(:user)
    redirect_back fallback_location: root_url, notice: "Signed out"
  end

  protected

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
