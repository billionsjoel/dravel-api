Rails.application.routes.draw do
  resources :user_reservations
  
  resources :trips
  # devise_for :users
  devise_for :users, defaults: { format: :json },
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  resources :user do 
    # resources :user_reservations
  end
  resources :trips do
    resources :reservations
  end
  get '/member-data', to: 'members#show'
end
