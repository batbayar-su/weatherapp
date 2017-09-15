Rails.application.routes.draw do
  # Home page
  root 'weathers#index'
  # Show single city data
  get ':city_name' => 'weathers#index'
  # Catch routing error
  # match "*path", to: "application#missing_error", via: :all
end
