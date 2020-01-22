Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'tops#index'
  resources :relationships, only: [:create, :destroy]
  resources :favorites,only: [:create,:destroy,:index]
  resources :posts do
    resources :comments
  end

  resources :conversations,only: [:index,:create] do
    resources :messages,only: [:index,:new,:create,:destroy]
  end



  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks',

}

# 必ずdevise_forより下に記載しないとエラー発生
resources :users,only: [:index,:show] do
  member do
    get :following, :followers
  end
end

  devise_scope :user do
   post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
    resources :posts, param: :slug
  end
end
