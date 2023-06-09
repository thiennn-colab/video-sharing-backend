Rails.application.routes.draw do
  devise_for :users, skip: :all

  get '/', to: 'health#check'

  devise_scope :user do
    post   '/login',       to: 'sessions#create'
    post   '/signup',       to: 'users#create'
    # put    '/account',      to: 'registrations#update'
    # delete '/account',      to: 'registrations#destroy'
    # put    '/password',     to: 'devise/passwords#update'
    # post   '/password',     to: 'devise/passwords#create'
    # get    '/confirmation', to: 'devise/confirmations#show'
    # post   '/unlock',       to: 'devise/unlocks#create'
    # get    '/unlock',       to: 'devise/unlocks#show'
  end

  resources :posts do
    resource :like, controller: "posts/likes"
    resource :dislike, controller: "posts/dislikes"
  end

  mount ActionCable.server => '/cable'
end
