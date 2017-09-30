Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    sessions:           'users/sessions'
  }

  resources :meals do
    member { post :join }
    member { post :confirm }
    member { post :close }
    collection { get :address }
  end

  get 'pages/index'
  root 'pages#index'

  get 'wallet' => 'pages#wallet'
end
