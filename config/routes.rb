Rails.application.routes.draw do
  root 'home#index'
  resources :users

  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login_submit' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #delete 'sessions/destroy', as: :logout
end
