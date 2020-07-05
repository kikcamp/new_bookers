Rails.application.routes.draw do
  root to: 'homes#index'

  get '/home/about', to: 'homes#about', as: 'about'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, controller: 'users', only: [:index, :show, :edit, :update]

  resources :books, only: [:index, :show, :edit, :create, :update, :destroy]
end
