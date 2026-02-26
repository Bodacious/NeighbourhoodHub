class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_user

  def current_user
    return nil unless session.key?(:user_id)

    @current_user ||= Identification.find_user(user_id: session[:user_id])
  end

  def sign_in_user(user)
    session[:user_id] = user.id
  end
end
