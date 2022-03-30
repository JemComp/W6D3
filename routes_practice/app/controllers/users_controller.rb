class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        @user = User.new(params.require(:user).permit(:name, :email))
        @user.save!
        render json: user

        # render json: params
    end

    def show 
        render plain: params
    end

end
# get "/users", to: "users#index"
#   post "/users", to: "users#create"
#   # get "/users/new", to "users#new", as: 'new_user'
#   # get "/users/:id/edit", to "users#edit" as 'edit_user'
#   get "/users/:id", to: "users#show", as: 'user'
#   patch "/users/:id", to: "users#update"
#   delete "/users/:id", to: "users#destroy"