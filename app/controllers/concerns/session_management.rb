# frozen_string_literal: true

module SessionManagement
  extend ActiveSupport::Concern

  included do
    helper_method :current_user, :signed_in?
  end

  protected

  def signed_in?(actor)
    getter_method_name = :"current_#{actor}"
    !!send(getter_method_name)
  end

  def current_user
    return nil unless session.key?(session_key(:user))

    @current_user ||= Identification.find_user(user_id: session[session_key(:user)])
  end

  def sign_in(user)
    session[session_key(:user)] = user.id
  end

  def sign_out(actor: :user)
    session.delete(session_key(actor))
  end

  def session_key(actor)
    (actor.to_s.underscore + "_id").to_sym
  end
end
