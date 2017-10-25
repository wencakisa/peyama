Rails.application.routes.draw do
  devise_for :users

  resources :messages, except: [:edit]

  root to: 'messages#new'
end
