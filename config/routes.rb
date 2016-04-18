Rails.application.routes.draw do
  root 'images#index'
  get 'static_pages/search'
  devise_for :users
  resources :users, only: [:show]
  resources :image_comments
  resources :images do
    member do
      put "like", to: "images#upvote"
      put "dislike", to: "images#downvote"
    end
  end
  match 'images/:id', to: 'images#destroy', as: 'destroy_image', via: :delete
  match 'image_comments/:id', to: 'image_comments#destroy', as: 'destroy_comment', via: :delete
  match 'users/:id/show_user_gallery/', to: 'users#show_user_gallery', as: 'users_show_user_gallery', via: :get
  match 'users/:id/show_user_bookmark/', to: 'users#show_user_bookmark', as: 'users_show_user_bookmark', via: :get
end
