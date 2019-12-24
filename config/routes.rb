Rails.application.routes.draw do
  root 'tops#index'

  resources :posts

  devise_for :users, controllers: {
    registrations: 'users/registrations'
}

resources :users,only: [:index,:show]



  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
