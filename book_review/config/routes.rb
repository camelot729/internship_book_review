Rails.application.routes.draw do
  resources :books do
    resources :review_comments
    resources :book_ratings
  end

  get "users/profile"
  devise_for :users

  root "users#profile"
end
