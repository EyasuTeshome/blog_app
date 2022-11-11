Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users

  resources :users, only: [:index, :show] do
    resources :posts, only: %i[index show destroy create new] do
      resources :comments, only: %i[destroy create new]
      resources :likes, only: [:create]
    end
    resources :posts, only: [:index, :show]
  end

  namespace :api do
    namespace :v1 do
      post :auth, to: 'authentication#create'
      resources :users, only: [] do
        resources :posts, only: [:index] do
          resources :comments, only: [:index, :create]
        end
      end
    end
  end

  root to: "users#index"
end
