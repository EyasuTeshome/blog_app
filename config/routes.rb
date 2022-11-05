Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :posts, only: %i[index show create new] do
      resources :comments, only: %i[create new]
      resources :likes, only: [:create]
    end
  end
  root to: "users#index"
end
