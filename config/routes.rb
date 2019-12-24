Rails.application.routes.draw do
  root 'posts#index'

  resources :posts
  # resources :users

  devise_for :users
  # , controllers:{
  #         registrations: 'users/registrations'
  # }


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
