Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  for path_name in %i[
    marketplace_listings
    new_marketplace_listings
    new_marketplace_listing
    new_event
    events
    new_booking
    bookings
    guidelines
    privacy
    terms
    support
    new_messaging_thread
    messaging_threads
    search
    new_identity_session
    identity_profile
    identity_session
    identity_settings
    identity_notification_preferences
    new_password_reset
  ]
    get "/", controller: 'dashboard', action: 'show', as: path_name
  end

  resources :registrations, only: [:new, :create]
  resource :session, only: [:new, :create] do
    post "sign_out" => "sessions#destroy", as: :sign_out
  end
  resource :dashboard, only: [:show], controller: "dashboard"
  root to: "dashboard#show"
end
