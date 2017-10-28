Rails.application.routes.draw do
  devise_for :users

  resources :messages, except: [:index, :edit]

  root to: 'messages#new'
end
