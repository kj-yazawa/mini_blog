Rails.application.routes.draw do
  devise_for :users
  resources :blogs do
    resources :entries, only: [:new, :create, :edit, :update, :show, :destroy] do
      resources :comments, only: [:create, :destroy] do
        member do
          post :approve
        end
      end
    end
  end
  root to: 'blogs#index'
end
