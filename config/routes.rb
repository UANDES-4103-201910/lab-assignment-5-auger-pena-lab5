Rails.application.routes.draw do
  get '/users/user_with_most_tickets', to: 'users#user_with_most_tickets'
  get '/events/upcoming_events', to: 'events#upcoming_events'
  resources :tickets
  resources :event_venues
  resources :events
  resources :users
  resources :ticket_types do
     resources :tickets
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
