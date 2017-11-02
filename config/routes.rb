Rails.application.routes.draw do
  root to: 'notes#new'

  resources :notes, except: [:index, :edit], param: :token
  post 'notes/api.:format'        => 'notes#create'
  get  'notes/api/:token.:format' => 'notes#show'

  devise_for :users
end
