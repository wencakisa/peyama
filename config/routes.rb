Rails.application.routes.draw do
  root to: 'messages#new'

  resources :messages, except: [:index, :edit], param: :token
  post 'messages/api' => 'messages#create'

  devise_for :users
end
