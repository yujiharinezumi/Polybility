Rails.application.routes.draw do
  root 'tops#index'

  resources :favorites, only: [:create, :destroy]

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
