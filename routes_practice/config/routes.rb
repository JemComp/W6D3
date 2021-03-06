Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "/users", to: "users#index"
  # post "/users", to: "users#create"
  # # get "/users/new", to "users#new", as: 'new_user'
  # # get "/users/:id/edit", to "users#edit" as 'edit_user'
  # get "/users/:id", to: "users#show", as: 'user'
  # patch "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"

  get "/users/:user_id/artworks", to: "artworks#index"
  # get "/users/:user_id/comments", to: "comments#index"
  # get "/users/:art/comments", to: "comments#index"


  # resources :users do
  #   resources :comments, only: [:index]
  # end
  
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :comments, only: [:index]
  end

  
  resources :artworks, only: [:create, :destroy, :show] do
    resources :comments, only: [:index]
  end

  # resources :artworks, only: [:create, :destroy, :show, :update]
  resources :artwork_shares, only: [:create, :destroy, :index, :show]
  resources :comments, only: [:create, :destroy, :show]



  
end

# Prefix Verb   URI Pattern                                                                              Controller#Action
# users GET    /users(.:format)                                                                         users#index
#       POST   /users(.:format)                                                                         users#create
# new_user GET    /users/new(.:format)                                                                     users#new
# edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#  user GET    /users/:id(.:format)                                                                     users#show
#       PATCH  /users/:id(.:format)                                                                     users#update
#       PUT    /users/:id(.:format)                                                                     users#update
#       DELETE /users/:id(.:format)                                                                     users#destroy