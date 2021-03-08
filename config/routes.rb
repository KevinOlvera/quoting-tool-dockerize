Rails.application.routes.draw do
  resources :regions
  resources :hourly_costs
  resources :quotes
  resources :cloud_management_systems
  resources :qty_ranges
  resources :ha_models
  resources :revenues
  resources :verticals
  resources :migrations
  devise_for :users
  resources :nuage_versions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
