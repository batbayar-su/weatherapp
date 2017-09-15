Rails.application.routes.draw do
  # Home page
  root 'weathers#index'
  # Catch routing error
  match "*path", to: "application#missing_error", via: :all
end
