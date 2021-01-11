Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :users, param: :yourfoot_ID, only: [:index, :show, :edit, :update]
  get 'users/:yourfoot_ID/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/:yourfoot_ID/withdraw', to: 'users#withdraw', as: 'withdraw'

  resources :user_relationships, only: [:create, :destroy]
  get '/users/:yourfoot_ID/followings', to: 'users#followings', as: 'followings'
  get '/users/:yourfoot_ID/followers', to: 'users#followers', as: 'followers'

end