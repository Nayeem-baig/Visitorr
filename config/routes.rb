Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }
  root to: 'spaces#index'

  resources :spaces do
    resources :residents
    resources :visitors do
      member do
        patch :check_out
      end
    end
    
    resources :dashboard
  end
end
