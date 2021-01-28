Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'timelines/index'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resource :timelines, only: [:index]

  resources :users, param: :yourfoot_ID, only: [:index, :show, :edit, :update]
  get 'users/:yourfoot_ID/preview', to: 'users#preview', as: 'preview'
  get 'users/:yourfoot_ID/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  patch 'users/:yourfoot_ID/withdraw', to: 'users#withdraw', as: 'withdraw'

  resources :user_relationships, only: [:create, :destroy]
  get '/users/:yourfoot_ID/followings', to: 'users#followings', as: 'followings'
  get '/users/:yourfoot_ID/followers', to: 'users#followers', as: 'followers'

  resources :pickteams, only: [:create, :update, :destroy]

  resources :matches, only: [:index, :show] do
    resources :previews, except: [:index] do
      resources :preview_comments, only: [:create, :destroy]
    end
    resources :reviews, except: [:index] do
      resources :review_comments, only: [:create, :destroy]
    end
  end
  post 'review_favorite/:id' => 'review_favorites#create', as: 'create_review_favorite'
  delete 'review_favorite/:id' => 'review_favorites#destroy', as: 'destroy_review_favorite'

  resources :teams, only: [:index, :show] do
    resource :team_relationships, only: [:create, :destroy]
  end
end
