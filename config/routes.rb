Rails.application.routes.draw do
  
  # devise_for :users
  devise_for :users, defaults: { format: :json },
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }

  resources :users 
  resources :trips do 
    resources :reservations
  end
  get '/member-data', to: 'members#show'
end
