Rails.application.routes.draw do
  # Home page
  root 'weathers#random'
  # Show single city data
  get ':city_name' => 'weathers#show'
  # Catch routing error
  # match "*path", to: "application#missing_error", via: :all
end
