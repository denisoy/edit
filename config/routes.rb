Rails.application.routes.draw do
  resources :nodes 
  root 'nodes#index'
end
