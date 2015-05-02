Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  resources :opinions, only: [:new, :create, :show]
end
