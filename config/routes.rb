Rails.application.routes.draw do
  root to: 'notes#new'

  post 'notes/api' => 'notes#create', defaults: { format: :json }

  resources :notes, except: [:index, :edit], param: :token

  devise_for :users
end
