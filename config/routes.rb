Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :bookings, only: %i[index edit update]
  resources :offers, only: [:show, :index, :edit, :update, :destroy] do
    resources :bookings, only: [:create]
  end
  get 'rates', to: 'rates#rate', as: :rates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
