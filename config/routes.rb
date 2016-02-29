Myapp::Application.routes.draw do

  devise_for :users
  # You can have the root of your site routed with "root"
  root to: 'dashboards#index'

  resources :dashboards

  namespace :api do
    resources :datapoints
  end


  authenticate :user do
    resources :probes
  end

  resources :studies
end
