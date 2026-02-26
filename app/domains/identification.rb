# frozen_string_literal: true

module Identification
  include Domain

  module_function

  ##
  # Authenticate a User based on the given email and password combo
  # @return [Identification::User, nil]
  def authenticate_user(email:, password:)
    user = User.find_by_email(email)
    user.authenticate(password)
  end

  def register_user(email:, name:, password:, password_confirmation:)
    User.create!(email: email, name: name, password: password, password_confirmation: password_confirmation)
  end

  def find_user(user_id:)
    User.find(user_id)
  end
end
