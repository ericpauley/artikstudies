Myapp::Application.routes.draw do

  devise_for :users
  # You can have the root of your site routed with "root"
  root to: 'dashboards#index'

  resources :dashboards

  namespace :api do
    resources :datapoints
    authenticate :user do
      resources :probes
    end
  end


  authenticate :user do
    resources :probes
  end
  authenticate :user do
    resources :studies, only: [:create, :new, :edit, :update]
  end
  resources :studies, only: [:show, :index]
end
