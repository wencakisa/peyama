Rails.application.routes.draw do
  resources :messages, except: [:edit]
  root 'messages#new'
end
