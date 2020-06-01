Rails.application.routes.draw do
  devise_for :users
  root to: 'users#index'

  resources :users, only:[:index, :show, :edit, :update, :destroy] do
    collection do
      get :chef
    end
  end
  post "recipes" => "recipes#create"
  post "/recipes/:id/edit" => "recipes#edit"
  # post "recipes/:id/update" => "recipes#update"
  resources :recipes, only:[:index,:new,:create,:show,:edit,:update,:destroy] do
    resources :comments,only:[:new, :create]
  end
end
