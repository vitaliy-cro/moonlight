Rails.application.routes.draw do

  resource :profile, only: :show

  namespace :profile do
    resources :stats, only: :index do
      post :increase
    end
    resource :inventory, only: :show
  end

  namespace :item do
    resources :categories, only: [:index, :show]
    resources :items, except: :all do
      post :buy
    end
  end

  root 'locations#main'

  devise_for :users

  resources :locations, only: :show do
    collection do
      get :main
      get :shop
    end
  end
end
