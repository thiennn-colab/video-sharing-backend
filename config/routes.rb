Rails.application.routes.draw do
  devise_for :users, skip: :all

  devise_scope :user do
    post   '/signin',       to: 'sessions#create'
    delete '/signout',      to: 'sessions#destroy'
    post   '/signup',       to: 'registrations#create'
    # put    '/account',      to: 'registrations#update'
    # delete '/account',      to: 'registrations#destroy'
    # put    '/password',     to: 'devise/passwords#update'
    # post   '/password',     to: 'devise/passwords#create'
    # get    '/confirmation', to: 'devise/confirmations#show'
    # post   '/unlock',       to: 'devise/unlocks#create'
    # get    '/unlock',       to: 'devise/unlocks#show'
  end

  root "articles#index"
end
