class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys

        if user.save
            render json: user 
       else
            render json: user.errors.full_messages, status: :unprocessable_entity
       end
            
        

        # render json: params
    end

    def show 
        @user = User.find_by(id: params[:id])
        
        if @user 
            render json: @user
        else
            render plain: 'No Such User!', status: 404
        end
    end

    def update
        @user = User.find_by(id: params[:id])

        if @user.update(user_params)
            redirect_to user_url(@user)
        else 
            render plain: 'No Such User!', status: 404
        end
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    
    def user_params
       params.require(:user).permit(:name,:email)
    end

               
            

end
# get "/users", to: "users#index"
#   post "/users", to: "users#create"
#   # get "/users/new", to "users#new", as: 'new_user'
#   # get "/users/:id/edit", to "users#edit" as 'edit_user'
#   get "/users/:id", to: "users#show", as: 'user'
#   patch "/users/:id", to: "users#update"
#   delete "/users/:id", to: "users#destroy"