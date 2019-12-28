Rails.application.routes.draw do
  # get 'relationships/create'
  # get 'relationships/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'

  resources :relationships, only: [:create, :destroy]
  resources :favorites
  resources :posts do
    resources :comments
  end

  resources :conversations do
    resources :messages
  end



  devise_for :users, controllers: {
    registrations: 'users/registrations'
}

resources :users,only: [:index,:show] do
  member do
      get :following, :followers
  end
end



  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
