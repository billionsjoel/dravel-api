Rails.application.routes.draw do
  
  # devise_for :users
  devise_for :users, defaults: { format: :json },
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :users do 
    # resources :user_reservations
    resources :reservations
  end
  resources :trips
  get '/member-data', to: 'members#show'
end
