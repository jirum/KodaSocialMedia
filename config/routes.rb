Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
  resources :posts, except: :show do
    resources :comments, except: :show
  end
  resources :friendships, only: [:index, :destroy, :create] do
  put :accept, :cancel, :resend
  end
  resources :groups
  resources :join_groups do
    put :accept, :ignore, :remove, :resend, :leave
  end
end
