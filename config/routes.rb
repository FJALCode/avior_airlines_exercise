Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :bookings, only: %i[index new create edit update]
  # resources :offers, only: [:new, :create, :show, :index] do
  #   resources :bookmarks, only: [:new, :create]
  # end  
  resources :offers
  get 'rates', to: 'rates#rate', as: :rates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
