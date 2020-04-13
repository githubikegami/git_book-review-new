Rails.application.routes.draw do
  devise_for :users
    root  'list#index'
    resources :bookreview, only: [:index, :show] do
        resources :comments, only: [:create, :edit, :update, :destroy]
            collection do
              get 'search'
            end
    end
    resources :ranking, only: [:index]
    resources :list, only: [:index]
    resources :users, only: [:show, :edit, :update, :destroy]
end