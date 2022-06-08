Rails.application.routes.draw do
  resources :reservations
  resources :trips
  # devise_for :users
  devise_for :users, defaults: { format: :json },
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
end
