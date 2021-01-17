Rails.application.routes.draw do


  resources :matches, only: [:index, :show]
  resources :teams, only: [:index, :show, :new, :create] do
    resource :team_relationships, only: [:create, :destroy]
    get :homes, on: :member
    get :aways, on: :member
  end
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  
  resources :users, param: :yourfoot_ID, only: [:index, :show, :edit, :update]
  get 'users/:yourfoot_ID/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/:yourfoot_ID/withdraw', to: 'users#withdraw', as: 'withdraw'

  resources :user_relationships, only: [:create, :destroy]
  get '/users/:yourfoot_ID/followings', to: 'users#followings', as: 'followings'
  get '/users/:yourfoot_ID/followers', to: 'users#followers', as: 'followers'

  resources :pickteams, only: [:create, :update, :destroy]
end
