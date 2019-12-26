Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'

  resources :favorites

  resources :posts do
    resources :comments
  end


  devise_for :users, controllers: {
    registrations: 'users/registrations'
}

resources :users,only: [:index,:show]



  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
