Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
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
