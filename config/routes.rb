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
  ]
    resources :registrations, only: [:new, :create]
    resource :dashboard, only:[:show], controller: "dashboard"

    get "/", controller: 'dashboard', action: 'show', as: path_name
  end


  root "dashboard#show"
end
