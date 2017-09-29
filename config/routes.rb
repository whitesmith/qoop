Rails.application.routes.draw do
  devise_for :users, controllers: {
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    sessions:           'users/sessions'
  }
  get 'pages/index'

  root 'pages#index'
end
