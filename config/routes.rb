Rails.application.routes.draw do
  root 'home#index'
  resources :users

  get 'register' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login_submit' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  #delete 'sessions/destroy', as: :logout

  get 'inbox' => 'messages#inbox'
  get 'messages/new'
  post 'messages' => 'messages#create'
  get 'messages' => 'messages#index'
end
