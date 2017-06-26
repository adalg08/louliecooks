Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  mount Attachinary::Engine => "/attachinary"
  resources :recipes do
    resources :ingredients
  end
end
