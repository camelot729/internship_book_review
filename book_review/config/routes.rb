Rails.application.routes.draw do

  resources :books do
    resources :review_comments
    resources :book_ratings
  end

  get 'users/profile'
  devise_for :users

  root 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
