Rails.application.routes.draw do
  # get 'bookings', to: 'bookings#index'
  # get 'bookings/new', to: 'bookings#new'
  # post 'bookings', to: 'bookings#create'
  # get 'bookings/:id/edit', to: 'bookings#edit', as: :edit_booking
  # patch 'bookings/:id', to: 'bookings#update'

  resources :bookings, only: %i[index new create edit update]

  devise_for :users
  root to: 'pages#home'
  get 'rates', to: 'rates#rate', as: :rates
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
