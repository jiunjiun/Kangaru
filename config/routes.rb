Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  namespace :admin do
    get :dashboard, to: 'dashboard#index', as: :dashboard

    resource :adapters
  end
end
