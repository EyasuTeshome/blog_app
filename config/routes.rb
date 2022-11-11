Rails.application.routes.draw do
  devise_for :users, path: "auth",
    path_names: {
      sign_in: "login",
      sign_out: "logout",
      password: "secret",
      confirmation: "verification",
      unlock: 'unblock',
      registration: 'register',
      sign_up: 'cmon_let_me_in'
  }
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
    resources :posts, only: %i[index show create new] do
      resources :comments, only: %i[create new]
      resources :likes, only: [:create]
    end
  end
  root to: "users#index"
end
