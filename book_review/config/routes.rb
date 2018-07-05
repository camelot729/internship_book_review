Rails.application.routes.draw do
  resources :review_comments
  resources :books
  get 'users/profile'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
