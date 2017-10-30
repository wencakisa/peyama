Rails.application.routes.draw do
  devise_for :users

  resources :notes, except: [:index, :edit]
  post 'notes/api' => 'notes#create'

  root to: 'notes#new'
end
