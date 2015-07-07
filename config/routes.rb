Rails.application.routes.draw do
  root 'welcome#index'
  resources :opinions, only: [:new, :create, :show] do
    resources :agrees, only: [:create]
  end
end
