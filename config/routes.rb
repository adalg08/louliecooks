Rails.application.routes.draw do
  devise_for :users
  root to: "recipes#index"
  get '/results/', to: 'recipes#search_results'
  mount Attachinary::Engine => "/attachinary"
  resources :recipes do
    resources :compositions, shallow: true
    resources :groups, shallow: true
  end
end
