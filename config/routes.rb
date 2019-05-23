Rails.application.routes.draw do
  resources :blogs do
    resources :entries, only: [:new, :create, :edit, :update, :show, :destroy]
  end
  root to: 'blogs#index'
end
