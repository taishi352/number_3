Rails.application.routes.draw do
  devise_for :users
  root 'users#top'
  get 'home/about' => "users#about"
  resources :users, only: [:new, :create, :index, :show, :edit, :update] do
  		get :about, on: :collection
  end
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
